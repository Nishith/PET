class EffortLogsController < ApplicationController
  # GET /effort_logs
  # GET /effort_logs.xml
  before_filter :authenticate_user!

  def index
    @effort_log = EffortLog.new
    @recent_deliverables = ProjectPhaseDeliverable.recently_logged

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recent_deliverables }
    end
  end

  def index_by_project
    @effort_log = EffortLog.new
    @projects = Project.all
    if(params[:id])
      @project = Project.find(params[:id])
    end
    respond_to do |format|
        format.html
        format.xml { render :xml => @project.effort_logs }
    end
  end

  # GET /effort_logs/1
  # GET /effort_logs/1.xml
  def show
    @effort_log = EffortLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @effort_log }
    end
  end

  # GET /effort_logs/new
  # GET /effort_logs/new.xml
  def new
    @effort_log = EffortLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @effort_log }
    end
  end

  # GET /effort_logs/1/edit
  def edit
    @effort_log = EffortLog.find(params[:id])
  end

  # POST /effort_logs
  # POST /effort_logs.xml
  def create
    @effort_log = EffortLog.new(params[:effort_log])
    @effort_log.user = current_user

    respond_to do |format|
      if @effort_log.save
        format.html { redirect_to(:controller => "effort_logs", :action => "index_by_project",
                                  :id => @effort_log.project_phase_deliverable.project_phase.project) }
        format.xml  { render :xml => @effort_log, :status => :created, :location => @effort_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @effort_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /effort_logs/1
  # PUT /effort_logs/1.xml
  def update
    @effort_log = EffortLog.find(params[:id])

    respond_to do |format|
      if @effort_log.update_attributes(params[:effort_log])
        format.html { redirect_to(:controller => "effort_logs", :action => "index_by_project",
                                  :id => @effort_log.project_phase_deliverable.project_phase.project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @effort_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /effort_logs/1
  # DELETE /effort_logs/1.xml
  def destroy
    @effort_log = EffortLog.find(params[:id])
    @effort_log.destroy

    respond_to do |format|
      format.html { redirect_to(effort_logs_url) }
      format.xml  { head :ok }
    end
  end
end
