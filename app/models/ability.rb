class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
      can :see_timestamps, User
    end
  end
end
