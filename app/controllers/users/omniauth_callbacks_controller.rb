class Users::OmniauthCallbacksController < ApplicationController

  def google
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user.persisted?
      @user.remember_me = true
      session["omniauth.token"] = request.env['omniauth.auth']['credentials']['token']
      session["omniauth.email"] = request.env['omniauth.auth']['info']['email']
      #@gmail = Gmail.connect(:xoauth2,'correos.pruebas.demos@gmail.com',request.env['omniauth.auth']['credentials']['token'])
      #puts @gmail.inspect
      #puts "TOKEN: #{session["omniauth.token"].inspect}"
      #puts "TOKEN: #{request.env['omniauth.auth']['credentials']['token'].inspect}"
      sign_in_and_redirect @user, event: :authentication
      return
    end

    session["devise.auth"] = request.env["omniauth.auth"]

    render :edit

  end

  def custom_sign_up
    @user = User.from_omniauth(session["devise.auth"])
    if @user.update(user_params)
      sign_in_and_redirect @user, event: :authentication
    else
      render :edit
    end
  end

  def failure
    redirect_to new_user_session_path, notice: "No pudimos loguearte. Error: #{params[:error_description]}. Motivo: #{params[:error_reason]}"
  end

  private
    def user_params
      params.require(:user).permit(:email)
    end



end