class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :destroy, Comment, user.admin: true # allows only admin to delete comments
  end

end
