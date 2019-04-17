class MentorshipsController < ApplicationController
  #before_action :check_login
  
    def index 
        @mentorships = Mentorship.all
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
    
    def update 
        @mentorship = Mentorship.find(params[:id]) 
        mentor = @mentorship.find_mentor 
        mentee = @mentorship.find_mentee 
        @mentorship.accept 
        @mentorship.save! 
        MentorshipMailer.acceptance_email_to_mentee(mentor, mentee).deliver_later!
        MentorshipMailer.acceptance_email_to_mentor(mentor, mentee).deliver_later!
        flash[:notice] = 'Mentorship approved' 
        redirect_to root_path
    end 
    
end