class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :programs
    can :access, :users
    cannot [:read, :update, :destory], :users
    can :access, :session
    if user
      case user.role
      when "admin"
        can :access, :all
      when "moderator"
        can :access, :imports
        can :access, :programs
        can :access, :users
      else
        can :create, :programs
        can :edit, :programs, user_id: user.id
        can :access, :users
      end
    end
  end
end
