class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    if user.admin?
      # can :manage, Product # add if only admin can change products
      can :destroy, Comment  #only admin can destory comments
    end
  end

end
