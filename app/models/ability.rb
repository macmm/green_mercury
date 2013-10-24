class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.is_admin?
      can :manage, :all
    end

    if !user.uuid.nil?
      
      can :manage, Event do |event|
        user.organizer?(event)
      end

      can [:read, :create], Event
      can [:read, :update, :create], Concept
      can [:read, :update, :create], ConceptDescription
      can :read, Profile
    end
  end
end
