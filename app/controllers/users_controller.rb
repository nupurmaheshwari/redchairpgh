class UsersController < ApplicationController
  before_action :check_login, except: :new
  
  before_action :set_user, only: [:show, :edit, :update, :change_password, :destroy, :profile, :setup]
  
  def index
    # get all visits in reverse chronological order, 10 per page
    @users = User.alphabetical#.paginate(page: params[:page]).per_page(10)
  end
  
  def show
    @user = @user
  end
  
  def new
    puts "HI"
    @user = User.new
  end
  
  def profile 
    if !current_user.is_new 
      redirect_to current_user
    end
  end
  
  def setup
  end 

  def create
    puts "user params down there"
    puts user_params
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
    puts params 
    puts user_params[:id]
    puts "SETUP ACCOUNT DETAILS^^"
    if user_params[:password]
      puts "haha"
      @user.update(user_params)
      if @user.save #.update_attributes(user_params)
        redirect_to (@user), notice: "Password was successfully changed."
      else
        render action: 'change_password'
      end
    else
      if @user.update_attributes(user_params)
        if @user.new_user? 
          puts "A NEW USER!!!"
          @user.update_attributes(:code_of_conduct => true) 
          @user.update_attributes(:is_new => false) 
          redirect_to setup_account_path(@user) 
        else 
          puts "NOT A NEW USER!!!!!!!!!!!!!!!!!!!"
          flash[:notice] = "Successfully updated your account."
          redirect_to @user
        end 
      else
        render action: 'edit'
      end
    end 
  end

  def change_password
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
    
    def user_params
      params.require(:user).permit(:uid, :provider, :role, :first_name, :last_name, :image_url, :email, :image_url, :url, :location, :code_of_conduct, :active, :is_new, :username, :agreed, :password, :password_confirmation, :created_at, :updated_at)
    end
end
