class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:read, :search], Ticket
    can :read, Activity
    

    if user.persisted? and user.kind_of?(User)
      can :create, Ticket
      can :update, Ticket, :ticketable_id => user.id, :ticketable_type => "User"

      can [:create], Activity
    end

    can :manage, :all if user.kind_of?(Admin)
      
  end
end
