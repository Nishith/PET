#This controller overrides the default user actions that are set by the Devise gem.
class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  #Presents a list of all users, assigns the list to the @users variable
  def index
    @users = User.all
    respond_to do |format|
      format.html { render "user/index" }
      format.xml  { render :xml => @users }
    end
  end

end
