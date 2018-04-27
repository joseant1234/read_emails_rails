class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_postulant
  before_action :set_emails_of_gmail

  def index    
    @mails.each do |email|
      body =  EmailReplyParser.parse_reply(email.text_part.decoded)

      Email.create({subject: email.subject,
        body: body,
        from: email.from[0],
        to: email.to[0],
        send_at: email.date,
        user: current_user, 
        postulant: @postulant})
    end

    @emails = Email.all

  end

  private
  def set_postulant
    @postulant = Postulant.find(params[:postulant_id])
  end

  def set_emails_of_gmail
    Mail.defaults do
     retriever_method   :pop3, :address    => "pop.gmail.com",
                        :port       => 995,
                        :user_name  => ENV["gmail_email"],
                        :password   => ENV["gmail_password"],
                        :enable_ssl => true
    end
    @mails = Mail.find(:what => :first, :count => 10, :order => :asc)

  end

end
