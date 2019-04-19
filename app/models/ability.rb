class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # permissions for admins
    if user.role? :admin
      can :manage, :all

    # permissions for instructors
    elsif user.role? :contributor
      
    # permissions for parents
    elsif user.role? :parent
      
    # permissions for guests
    else
      can [:index, :about, :contact, :privacy], :home

      can :read, Curriculum
      can [:read, :actual_instructors, :actual_students, :camp_instructors, :registrations], Camp
      can :read, Location

      can :create, Family
      can :create, User
    end
  end
end
