class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Fact

    can [:create, :update, :destroy], Fact do |fact|
      fact.user == user
    end
  end
end
