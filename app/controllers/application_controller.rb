class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :admin?
  helper_method :logged_in?
  
  def current_user
    User.find(session[:user_id])
  end
  
  def logged_in?
    session[:user_id].present?
  end
  
  def admin?
    redirect to root_url, :notice=> "You must be an administrator for this feature" unless current_user.admin = true
  end

  def require_user
    redirect_to new_sessions_url, :notice=> "Please log in to continue." unless logged_in?
    @user = User.find_by_id(session[:user_id])      
  end
end
