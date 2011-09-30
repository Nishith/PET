class Users::InvitationsController < Devise::InvitationsController
  authorize_resource :class => false
  skip_authorize_resource :only => [:edit,:update]

  def after_invite_path_for(resource)
    users_path
  end

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