# The lifecycle_phases_controller manage LifecyclePhase.
# Available actions include creation, modification, deletion and show.
#

class LifecyclePhasesController < ApplicationController
  before_filter :authenticate_user!

  # Triggered by "GET /lifecycle_phases".
  # Display all LifecyclePhase.
  def index
    @lifecycle_phases = LifecyclePhase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycle_phases }
    end
  end

  # Triggered by "GET /lifecycle_phases/:id".
  # Show the LifecyclePhase specified by user.
  def show
    @lifecycle_phase = LifecyclePhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end

  # Triggered by "GET /lifecycle_phases/new".
  # Display the creation form for users to create new LifecyclePhase.
  def new
    @lifecycle_phase = LifecyclePhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end

  # Triggered by "GET /lifecycle_phases/:id/edit".
  # Display the edition form.
  def edit
    @lifecycle_phase = LifecyclePhase.find(params[:id])
  end

  # Triggered by "POST /lifecycle_phases".
  # Receive the parameters from client side and create a new LifecyclePhase.
  def create
    @lifecycle_phase = LifecyclePhase.new(params[:lifecycle_phase])

    respond_to do |format|
      if @lifecycle_phase.save
        format.html { redirect_to(@lifecycle_phase, :notice => 'Lifecycle phase was successfully created.') }
        format.xml  { render :xml => @lifecycle_phase, :status => :created, :location => @lifecycle_phase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lifecycle_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by "PUT /lifecycle_phases/:id".
  # Receive the parameters from client side and update the LifecyclePhase.
  def update
    @lifecycle_phase = LifecyclePhase.find(params[:id])

    respond_to do |format|
      if @lifecycle_phase.update_attributes(params[:lifecycle_phase])
        format.html { redirect_to(@lifecycle_phase, :notice => 'Lifecycle phase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lifecycle_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by "DELETE /lifecycle_phases/:id".
  # Delete a LifecyclePhase.
  def destroy
    @lifecycle_phase = LifecyclePhase.find(params[:id])
    @lifecycle_phase.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycle_phases_url) }
      format.xml  { head :ok }
    end
  end
end
