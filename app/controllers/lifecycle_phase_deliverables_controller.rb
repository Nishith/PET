# The lifecycle_phase_deliverables_controller manage LifecyclePhaseDeliverable.
# Available actions include creation, modification, deletion and show.
#

class LifecyclePhaseDeliverablesController < ApplicationController
  authorize_resource :class => false
  before_filter :authenticate_user!

  # Triggered by "GET /lifecycle_phase_deliverables".
  # Display all LifecyclePhaseDeliverable.
  def index
    @lifecycle_phase_deliverables = LifecyclePhaseDeliverable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycle_phase_deliverables }
    end
  end

  # Triggered by "GET /lifecycle_phase_deliverables/:id".
  # Show the LifecyclePhaseDeliverable specified by user.
  def show
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle_phase_deliverable }
    end
  end

  # Triggered by "GET /lifecycle_phase_deliverables/new".
  # Display the creation form for users to create new LifecyclePhaseDeliverable.
  def new
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle_phase_deliverable }
    end
  end

  # Triggered by "GET /lifecycle_phase_deliverables/:id/edit".
  # Display the edition form.
  def edit
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.find(params[:id])
  end

  # Triggered by "POST /lifecycle_phase_deliverables".
  # Receive the parameters from client side and create a new LifecyclePhaseDeliverable.
  def create
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.new(params[:lifecycle_phase_deliverable])

    respond_to do |format|
      if @lifecycle_phase_deliverable.save
        format.html { redirect_to(@lifecycle_phase_deliverable, :notice => 'Lifecycle phase deliverable was successfully created.') }
        format.xml  { render :xml => @lifecycle_phase_deliverable, :status => :created, :location => @lifecycle_phase_deliverable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lifecycle_phase_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by "PUT /lifecycle_phase_deliverables/:id".
  # Receive the parameters from client side and update the LifecyclePhaseDeliverable.
  def update
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.find(params[:id])

    respond_to do |format|
      if @lifecycle_phase_deliverable.update_attributes(params[:lifecycle_phase_deliverable])
        format.html { redirect_to(@lifecycle_phase_deliverable, :notice => 'Lifecycle phase deliverable was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lifecycle_phase_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by "DELETE /lifecycle_phase_deliverables/:id".
  # Delete a LifecyclePhaseDeliverable.
  def destroy
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.find(params[:id])
    @lifecycle_phase_deliverable.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycle_phase_deliverables_url) }
      format.xml  { head :ok }
    end
  end
end
