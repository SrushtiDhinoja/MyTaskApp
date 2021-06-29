class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to sign_in_path, alert:"You must be signed in!!!" if @current_user.nil?
  end
end
