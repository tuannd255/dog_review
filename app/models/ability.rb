class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      if namespace == "admin"
        cannot :manage, :all
      end
      can [:read, :create], Dog
      can :manage, Review
      can [:edit, :update, :read], User do |other_user|
        user == other_user
      end
    end
  end
end
