# class SessionsController < ApplicationController
#   def new
#   end
  
#   def create
#     user = User.authenticate(params[:username], params[:password])
#     if user
#       session[:user_id] = user.id
#       redirect_to home_path, notice: "Logged in!"
#     else
#       flash.now.alert = "Username and/or password is invalid"
#       render "new"
#     end
#   end
  
#   def auth 
  
#   end 
  
#   def destroy
#     session[:user_id] = nil
#     redirect_to home_path, notice: "Logged out!"
#   end
# end


class SessionsController < ApplicationController
  
  def create
    #render plain: request.env['omniauth.auth']
    begin
      auth_hash = request.env['omniauth.auth']
      @user = User.from_omniauth(auth_hash)
      if !@user 
        @user = User.new(auth_hash['uid'], auth_hash['info']['first_name'],
        auth_hash['info']['last_name'], auth_hash['info']['picture_url'])
      end
      session[:user_id] = @user.id
      #flash[:success] = "Welcome, #{@user.first_name}!"
    rescue
     flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end

  def auth_failure
    puts request.env['omniauth.auth'].to_yaml
    redirect_to about_path
  end
end