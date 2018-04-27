class Email < ApplicationRecord
  belongs_to :user
  belongs_to :postulant
  
  def save_emails_from_gmail(emails_gmail)
  	emails_gmail.each do |email|
  		if email.attachments.length > 0
  			attachment_gmail = email.attachments[0]

  		end
  	end

  end
end
