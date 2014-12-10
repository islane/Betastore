class Admin::BaseController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def logged_in?
    session[:user_id].present?
  end

  def require_login
    unless logged_in?
       redirect_to admin_login_path, alert: 'Please log in to continue'
    end
  end

end
