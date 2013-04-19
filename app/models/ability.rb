class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :programs
    can :create, :users
    can :access, :session
    if user
      case user.role
      when "admin"
        can :access, :all
      else
        can :create, :programs
        can :edit, :programs, user_id: user.id
        can :access, :users, id: user.id
      end
    end
  end
end
