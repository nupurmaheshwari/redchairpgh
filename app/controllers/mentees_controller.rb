class MenteesController < ApplicationController
    before_action :check_login

    def new
        @mentee = Mentee.new
    end
    
    def create
        @mentee = Mentee.new(mentee_params)
        if @mentee.save
          flash[:notice] = "Successfully created mentee profile."
          redirect_to visit_path(@mentee.visit)
        else
        end
    end
    
    def destroy
        @mentee = Mentee.find(params[:id])
        @mentee.destroy
        flash[:notice] = "Successfully deleted mentee profile."
        redirect_to home_path
    end
    
    private
    def mentee_params
      params.require(:mentee).permit(:user_id)
    end
end