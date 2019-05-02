class MentorshipsController < ApplicationController
    # before_action :check_login
    before_action :set_mentorship, only: [:show, :edit, :update, :destroy]
    authorize_resource
    
    def index 
        if current_user.role?(:admin)
            @mentorships = Mentorship.all
        else 
        #     mentor = Mentor.find(mentorship.mentor_id).first 
        #     mentee = Mentee.find(mentorship.mentee_id).first
        #     user.id == mentor.user_id || user.id == mentee.user_id 
            @mentor = Mentor.for_user(current_user.id).first 
            @mentee = Mentee.for_user(current_user.id).first 
            user_mentorships = [] 
            # mentors.each do |mentor|
            #     user_mentorships += Mentorship.for_mentor(mentor.id).all 
            # end 
            if @mentor
                user_mentorships += Mentorship.for_mentor(@mentor.id).all 
                @requests = @mentor.get_requests
            end 
            
            # mentees.each do |mentee| 
            #     user_mentorships += Mentorship.for_mentee(mentee.id).all 
            # end 
            if @mentee 
                user_mentorships += Mentorship.for_mentee(@mentee.id).all 
                @matches = @mentee.get_matches
            end 
            
            @mentorships = user_mentorships
        end 
    end 
    
    def create 
        mentee = Mentee.find(params[:mentee_id])
        @mentorship = Mentorship.new(mentor_id: params[:mentor_id], 
                                     mentee_id: params[:mentee_id],
                                     status: 'pending') 
        if @mentorship.save 
            flash[:notice] = 'Request sent!' 
            redirect_to root_path 
        else 
            flash[:notice] = 'Unable to send request.' 
            redirect_to mentee_matches_path(mentee)
        end
    end
    
    def destroy 
        @mentorship = Mentorship.find(params[:id]) 
        @mentorship.destroy 
        flash[:notice] = 'Successfully deleted relationship' 
        redirect_to root_path
    end 
    
    def edit 
    end 
    
    def update 
        mentor = @mentorship.find_mentor 
        mentee = @mentorship.find_mentee 
        @mentorship.accept 
        @mentorship.save! 
        MentorshipMailer.acceptance_email_to_mentee(mentor, mentee).deliver_later!
        MentorshipMailer.acceptance_email_to_mentor(mentor, mentee).deliver_later!
        flash[:notice] = 'Mentorship approved!' 
        redirect_to root_path
    end 
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentorship
      @mentorship = Mentorship.find(params[:id])
    end
    def mentorship_params
      params.require(:mentorship).permit(:mentor_id, :mentee_id, :status)
    end
    
    
end