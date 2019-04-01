class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD

    private
  # Handling authentication
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def logged_in?
    current_user
  end
  helper_method :logged_in?
  
  def check_login
    redirect_to login_path, alert: "You need to log in to view this page." if current_user.nil?
  end
=======
>>>>>>> 03d3b8e4a1e6b11c52868e004db4c1f75b3816b9
end
