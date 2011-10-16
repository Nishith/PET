# This controller overrides the default methods for the Devise_Invitable gem
# so that the custom attributes not normally assigned to the user model can
# be taken into account.

class User::InvitationsController < Devise::InvitationsController
  authorize_resource :class => false
  skip_authorize_resource :only => [:edit,:update]

  # Returns the path to which the user is redirected to after sending an invitation
  #
  # === Parameters
  # * resource : The object that has been invited.

  def after_invite_path_for(resource)
    users_path
  end

  # Handles the POST request for a new invitation, if it contains some errors,
  # the user is redirected back to the form. If the save is successful, the
  # user is redirected to the path returned by _after_invite_path_for_
  #
  # === Parameters
  # * @user : The user object that wants to be created and invited.

  def create
    @user = User.invite!(params[:user], current_inviter)

    if @user.errors.empty?
      set_flash_message :notice, :send_instructions, :email => @user.email
      respond_with resource, :location => after_invite_path_for(@user)
    else
      respond_with_navigational(@user) { render_with_scope :new }
    end
  end
end