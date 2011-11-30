# EffortLogsController manages EffortLog
#
class EffortLogsController < ApplicationController

  before_filter :authenticate_user!

  # Triggered by "GET /effort_logs".
  # list all effot logs
  def index
    @effort_log = EffortLog.new
    @recent_deliverables = ProjectPhaseDeliverable.recently_logged_by_user(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recent_deliverables }
    end
  end

  # should contain params[:id] as project id
  # list all effort log for that project
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

  # Triggered by "GET /effort_logs/1".
  # Show a effort log
  def show
    @effort_log = EffortLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @effort_log }
    end
  end

  # Triggered by "GET /effort_logs/new".
  # Display the new form
  def new
    @effort_log = EffortLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @effort_log }
    end
  end

  # Triggered by "GET /effort_logs/1/edit".
  # Display the edit form
  def edit
    @effort_log = EffortLog.find(params[:id])
  end

  # Triggered by "POST /effort_logs".
  # Receive parameters from client side and create a effort log
  def create
    @effort_log = EffortLog.new(params[:effort_log])
    @effort_log.user = current_user

    respond_to do |format|
      if @effort_log.save
        unless params[:mark_deliverable_as_finished].blank? || params[:mark_deliverable_as_finished] != "0"
          unless @effort_log.project_phase_deliverable.mark_finished
            flash[:error] = "Something went wrong finishing the deliverable"
            format.html { render :action => "new"}
            format.xml  { render :xml => @effort_log.errors, :status => :unprocessable_entity }
          end
        end
        format.html { redirect_to(:controller => "effort_logs", :action => "index_by_project",
                                  :id => @effort_log.project_phase_deliverable.project_phase.project) }
        format.xml  { render :xml => @effort_log, :status => :created, :location => @effort_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @effort_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by "PUT /effort_logs/1".
  # Receive parameters from client side and update a effort log
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

  # Triggered by "DELETE /effort_logs/1".
  # destroy an effort log
  def destroy
    @effort_log = EffortLog.find(params[:id])
    @effort_log.destroy

    respond_to do |format|
      format.html { redirect_to(effort_logs_url) }
      format.xml  { head :ok }
    end
  end
end
