class LifecyclePhaseDeliverablesController < ApplicationController
  before_filter :authenticate_user!

  # GET /lifecycle_phase_deliverables
  # GET /lifecycle_phase_deliverables.xml
  def index
    @lifecycle_phase_deliverables = LifecyclePhaseDeliverable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycle_phase_deliverables }
    end
  end

  # GET /lifecycle_phase_deliverables/1
  # GET /lifecycle_phase_deliverables/1.xml
  def show
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle_phase_deliverable }
    end
  end

  # GET /lifecycle_phase_deliverables/new
  # GET /lifecycle_phase_deliverables/new.xml
  def new
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle_phase_deliverable }
    end
  end

  # GET /lifecycle_phase_deliverables/1/edit
  def edit
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.find(params[:id])
  end

  # POST /lifecycle_phase_deliverables
  # POST /lifecycle_phase_deliverables.xml
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

  # PUT /lifecycle_phase_deliverables/1
  # PUT /lifecycle_phase_deliverables/1.xml
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

  # DELETE /lifecycle_phase_deliverables/1
  # DELETE /lifecycle_phase_deliverables/1.xml
  def destroy
    @lifecycle_phase_deliverable = LifecyclePhaseDeliverable.find(params[:id])
    @lifecycle_phase_deliverable.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycle_phase_deliverables_url) }
      format.xml  { head :ok }
    end
  end
end
