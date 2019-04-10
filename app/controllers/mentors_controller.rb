class MentorsController < ApplicationController
    #before_action :check_login
    before_action :set_mentor, only: [:show, :edit, :update, :destroy]

    def new
        @mentor = Mentor.new
    end
    
    def edit
    end 
    
    def update 
    end 
    
    def create
        @mentor = Mentor.new(mentor_params)
        if @mentor.save
          flash[:notice] = "Successfully created mentor profile."
          redirect_to @mentor
        else
            render action: 'new'
        end
    end
    
    def show
    end 
    
    def destroy
        @mentor = Mentor.find(params[:id])
        @mentor.destroy
        flash[:notice] = "Successfully deleted mentor profile."
        redirect_to home_path
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentor
      @mentor = Mentor.find(params[:id])
    end
    def mentor_params
      params.require(:mentor).permit(:user_id, :is_active, :current_role, :years_in_field, :years_in_lead,
                                     :gender, :comm_frequency, :bio, :motivation, :specialized_skills, :mentor_roles)
    end
    
end