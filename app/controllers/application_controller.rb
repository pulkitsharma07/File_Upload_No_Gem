class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    unless current_user
      redirect_to '/register'
      false
    end
  end
end
