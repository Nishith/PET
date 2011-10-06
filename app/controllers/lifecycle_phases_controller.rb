class LifecyclePhasesController < ApplicationController
  before_filter :authenticate_user!

  # GET /lifecycle_phases
  # GET /lifecycle_phases.xml
  def index
    @lifecycle_phases = LifecyclePhase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycle_phases }
    end
  end

  # GET /lifecycle_phases/1
  # GET /lifecycle_phases/1.xml
  def show
    @lifecycle_phase = LifecyclePhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end

  # GET /lifecycle_phases/new
  # GET /lifecycle_phases/new.xml
  def new
    @lifecycle_phase = LifecyclePhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle_phase }
    end
  end

  # GET /lifecycle_phases/1/edit
  def edit
    @lifecycle_phase = LifecyclePhase.find(params[:id])
  end

  # POST /lifecycle_phases
  # POST /lifecycle_phases.xml
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

  # PUT /lifecycle_phases/1
  # PUT /lifecycle_phases/1.xml
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

  # DELETE /lifecycle_phases/1
  # DELETE /lifecycle_phases/1.xml
  def destroy
    @lifecycle_phase = LifecyclePhase.find(params[:id])
    @lifecycle_phase.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycle_phases_url) }
      format.xml  { head :ok }
    end
  end
end
