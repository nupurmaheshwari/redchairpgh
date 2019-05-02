class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # permissions for admins
    if user.role? :admin
      can [:read, :show, :edit, :update, :deactivate], :all

    elsif user.role?(:contributor) && user.active
      can [:index, :about, :contact, :privacy], :home
      can [:show, :setup, :create_profile, :edit, :update, :new, :change_password], User do |u|
        u.id == user.id
      end
      
      can [:show, :update, :destroy], Mentorship do |mentorship|
        mentor = Mentor.find(mentorship.mentor_id).first 
        mentee = Mentee.find(mentorship.mentee_id).first
        user.id == mentor.user_id || user.id == mentee.user_id 
      end
      
      can [:index], Mentorship
      
      if !user.is_mentor? && !user.is_mentee? 
        can :create, Mentor 
        can :create, Mentee 
      end 
        
      if user.is_mentor? 
        can [:show, :update, :destroy], Mentor do |mentor|
          mentor.user_id == user.id
        end
        can [:show], Mentee do |mentee| 
          mentor.get_requests.include? mentee 
        end 
      
      elsif user.is_mentee? 
        can [:show, :update, :destroy], Mentee do |mentee|
          mentee.user_id == user.id
        end
        can [:show], Mentor do |mentor| 
          mentee.get_matches.include? mentor.id
        end
        can :create, Mentorship
      end
    else 
      can [:index, :about, :contact, :privacy], :home
      can [:show], User do |u|
        u.id == user.id
      end
    end
  end
end
