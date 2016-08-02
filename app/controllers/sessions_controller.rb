class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by email: params[:session][:email].downcase
  	if user && user.authenticate(params[:session][:password])
      if user.activated?
    		flash[:success] = t("messages.login.success")
    		log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    		redirect_to user_path user
      else
        flash[:danger] =  t("email.message_not_actived")
        redirect_to root_url
      end
  	else
  		flash[:danger] = t("messages.login.fail")
  		render :new
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
