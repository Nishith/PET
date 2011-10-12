# The lifecycles_controller manage Lifecycle.
# Available actions include creation, modification, deletion and show.
#

class LifecyclesController < ApplicationController
  before_filter :authenticate_user!

  # Triggered by "GET /lifecycles".
  # Display all Lifecycle.
  def index
    @lifecycles = Lifecycle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycles }
    end
  end

  # Triggered by "GET /lifecycles/:id".
  # Show the Lifecycle specified by user.
  def show
    @lifecycle = Lifecycle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle }
    end
  end

  # Triggered by "GET /lifecycles/new".
  # Display the creation form for users to create new Lifecycle.
  def new
    @lifecycle = Lifecycle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle }
    end
  end

  # Triggered by "GET /lifecycles/:id/edit".
  # Display the edition form.
  def edit
    @lifecycle = Lifecycle.find(params[:id])
  end

  # Triggered by "POST /lifecycles".
  # Receive the parameters from client side and create a new Lifecycle.
  def create
    @lifecycle = Lifecycle.new(params[:lifecycle])

    respond_to do |format|
      if @lifecycle.save
        format.html { redirect_to(@lifecycle, :notice => 'Lifecycle was successfully created.') }
        format.xml  { render :xml => @lifecycle, :status => :created, :location => @lifecycle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lifecycle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by "PUT /lifecycles/:id".
  # Receive the parameters from client side and update the Lifecycle.
  def update
    @lifecycle = Lifecycle.find(params[:id])

    respond_to do |format|
      if @lifecycle.update_attributes(params[:lifecycle])
        format.html { redirect_to(@lifecycle, :notice => 'Lifecycle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lifecycle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by "DELETE /lifecycles/:id".
  # Delete a Lifecycle.
  def destroy
    @lifecycle = Lifecycle.find(params[:id])
    @lifecycle.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycles_url) }
      format.xml  { head :ok }
    end
  end
end
