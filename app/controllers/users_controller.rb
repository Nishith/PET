class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    render 'user/index'
  end

end
