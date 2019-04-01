class UsersController < ApplicationController
  before_action :check_login
  
  def index
    # get all visits in reverse chronological order, 10 per page
    @users = User.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome, #{@user.first_name}."
      redirect_to @user
    else
      render action: 'new'
    end
  end 
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated your account."
      redirect_to @user
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "Successfully deleted your account."
    redirect_to root_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :image_url, :email, :profile_url, :location, :active)
    end
end