class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def logged_in?
    current_user
  end
  helper_method :logged_in?
  
  def check_login
    puts "checking login, current user"
    puts current_user
    if current_user.nil?
      redirect_to login_path, alert: "You need to log in to view this page."
    end 
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You do not have permission to view this page."
    redirect_to home_path
  end

end
