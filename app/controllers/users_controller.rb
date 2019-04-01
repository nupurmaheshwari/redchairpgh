class UsersController < ApplicationController
  before_action :check_login
	
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully added as a user."
      redirect_to users_url
    else
      render action: 'users/new'
    end
  end
  
  def destroy
    if @user.destroy
      redirect_to users_url, notice: "Successfully removed #{@user.proper_name} from the PATS system."
    else
      render action: 'show'
    end
  end
   private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthdate, :email, :zipcode, :linkedin_link, :password, :password_confirmation, :is_admin)
    end
end