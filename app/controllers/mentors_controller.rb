class MentorsController < ApplicationController
    #before_action :check_login

    def new
        @mentor = Mentor.new
    end
    
    def create
        @mentor = Mentor.new(mentor_params)
        if @mentor.save
          flash[:notice] = "Successfully created mentor profile."
          redirect_to visit_path(@mentor.visit)
        else
        end
    end
    
    def destroy
        @mentor = Mentor.find(params[:id])
        @mentor.destroy
        flash[:notice] = "Successfully deleted mentor profile."
        redirect_to home_path
    end
    
    private
    def mentor_params
      params.require(:mentor).permit(:user_id)
    end
end