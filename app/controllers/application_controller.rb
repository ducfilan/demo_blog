class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
  	render html: "<h1>Hello World!!!</h1>"
  end

  private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = t("messages.login.require")
        redirect_to root_url
      end
    end
end
