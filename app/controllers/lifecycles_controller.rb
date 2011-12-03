# The lifecycles_controller manages Lifecycle.
# Available actions include creation, modification, deletion and show.
#

class LifecyclesController < ApplicationController
  authorize_resource :class => false
  before_filter :authenticate_user!

  # Triggered by "GET /lifecycles".
  # Display all Lifecycles.
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
    @lifecycles = Lifecycle.all
    @new_lifecycle = Lifecycle.new

    @lifecycle_phase = LifecyclePhase.new
    @lifecycle_phase.lifecycle_id = @lifecycle.id
    number_of_phases = LifecyclePhase.find_all_by_lifecycle_id(@lifecycle.id).size
    @lifecycle_phase.position = number_of_phases + 1

    @new_lifecycle_phase_deliverable = LifecyclePhaseDeliverable.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle }
    end
  end

  # Triggered by "GET /lifecycles/new".
  # Display the creation form for users to create new Lifecycle.
  def new
    @new_lifecycle = Lifecycle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new_lifecycle }
    end
  end

  # Triggered by "GET /lifecycles/:id/edit".
  # Display the editing form.
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
    @phases = LifecyclePhase.find_all_by_lifecycle_id(params[:id])
    @phases.each do |p|
      @deliverables = LifecyclePhaseDeliverable.find_all_by_lifecycle_phase_id(p.id)
      @deliverables.each do |ds|
        ds.destroy
      end
      p.destroy
    end
    @lifecycle.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycles_url) }
      format.xml  { head :ok }
    end
  end

  # Used to keep track of the positions of the lifecycle phases in the list
  def sort
    if params['phase'].is_a? Array
      params['phase'].each do |phase|
        @phase = LifecyclePhase.find(phase)
        @phase.update_attribute("position",params['phase'].index(@phase.id.to_s) + 1)
      end
      respond_to do |format|
        format.json { head :ok }
      end
    end
  end

end
