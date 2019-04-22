class SessionsController < ApplicationController
  
  def create
    puts request.env['omniauth.auth']
    begin
      auth_hash = request.env['omniauth.auth']
      puts auth_hash
      @user = User.from_omniauth(auth_hash)
      if @user.nil? 
        puts "GOOD no user profile for you yet!"
        @user = User.new(uid: auth_hash['uid'], provider: auth_hash['provider'], 
        role: 'contributor', first_name: auth_hash['info']['first_name'], 
        last_name: auth_hash['info']['last_name'], image_url: auth_hash['info']['picture_url'],
        code_of_conduct: false, active: false, is_new: true)
        @user.save 
      end
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.first_name}!"
    rescue
    flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to create_profile_path(@user.id)
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