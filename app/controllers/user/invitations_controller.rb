class User::InvitationsController < Devise::InvitationsController
  authorize_resource :class => false
  skip_authorize_resource :only => :edit

  def after_invite_path_for(resource)
    users_path
  end

  def create
    self.resource = resource_class.invite!(:email => params[:user][:email], :role => params[:role],
                                           :invited_by_id => current_user.id, :invited_by_type => current_user.class.name,
                                           :skip_invitation => true)

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render_with_scope :new }
    end
  end
end