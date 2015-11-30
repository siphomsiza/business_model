class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.has_role?("Admin User")
       can :manage, :all
    else
      can :manage, :all
    end
  end
end
