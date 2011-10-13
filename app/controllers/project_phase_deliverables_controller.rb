class ProjectPhaseDeliverablesController < ApplicationController
  authorize_resource :class => false
  skip_authorize_resource :only => [:index,:show]

  before_filter :authenticate_user!

  # GET /project_phase_deliverables
  # GET /project_phase_deliverables.xml
  def index
    @project_phase_deliverables = ProjectPhaseDeliverable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_phase_deliverables }
    end
  end

  # GET /project_phase_deliverables/1
  # GET /project_phase_deliverables/1.xml
  def show
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_phase_deliverable }
    end
  end

  # GET /project_phase_deliverables/new
  # GET /project_phase_deliverables/new.xml
  def new
    @project_phase_deliverable = ProjectPhaseDeliverable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_phase_deliverable }
    end
  end

  # GET /project_phase_deliverables/1/edit
  def edit
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])
  end

  # POST /project_phase_deliverables
  # POST /project_phase_deliverables.xml
  def create
    @project_phase_deliverable = ProjectPhaseDeliverable.new(params[:project_phase_deliverable])

    respond_to do |format|
      if @project_phase_deliverable.save
        format.html { redirect_to(@project_phase_deliverable, :notice => 'Project phase deliverable was successfully created.') }
        format.xml  { render :xml => @project_phase_deliverable, :status => :created, :location => @project_phase_deliverable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_phase_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_phase_deliverables/1
  # PUT /project_phase_deliverables/1.xml
  def update
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])

    respond_to do |format|
      if @project_phase_deliverable.update_attributes(params[:project_phase_deliverable])
        format.html { redirect_to(@project_phase_deliverable, :notice => 'Project phase deliverable was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_phase_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_phase_deliverables/1
  # DELETE /project_phase_deliverables/1.xml
  def destroy
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])
    @project_phase_deliverable.destroy

    respond_to do |format|
      format.html { redirect_to(project_phase_deliverables_url) }
      format.xml  { head :ok }
    end
  end
end
