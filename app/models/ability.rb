#Class created by the CanCan gem to define the abilities given to each user role.
#Three roles are defined and given specific permissions:
#* Admin
#* Manager
#* Developer
#
#Currently the permissions granted to Admins and Managers are the same except
#for the creation of other Admin users. Developers are limited to listing and viewing projects
#and lifecycles.

class Ability
  include CanCan::Ability

  #Method that defines the possible actions a user with a certain role can do.
  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? "admin"
      can :manage, :all
    elsif user.role? "manager"
      can :manage, :all
    else
      can :manage, :all #developer
      cannot :manage, :lifecycle
      cannot :manage, :lifecycle_phase
      cannot :manage, :lifecycle_phase_deliverable
      cannot :manage, :project
      cannot :manage, :project_phase
      cannot :manage, :project_phase_deliverable
      cannot :manage, :invitation
      can :edit, :invitation
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
