class Ability
  include CanCan::Ability

  def initialize user, namespace
    user ||= User.new
    if user.is_admin?
      can :manage, :all
    else
      if namespace == "admin"
        cannot :manage, :all
      else
        can [:read, :create, :destroy], Dog
        can [:update], Dog do |other_dog|
          other_dog.user == user
        end
        can :manage, Review
        can [:edit, :update, :read], User do |other_user|
          user == other_user
        end
        can [:create, :destroy, :read], Favorite
      end
    end
  end
end
