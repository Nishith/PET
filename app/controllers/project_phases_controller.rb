# The project_phases_controller manages individual project phases
# Available actions include creation, modification, deletion and show.
# All actions except listing all project phase and viewing a
# single project phase require the user to be logged in.

class ProjectPhasesController < ApplicationController
  authorize_resource :class => false
  skip_authorize_resource :only => [:index,:show]

  before_filter :authenticate_user!

  # Triggered by GET /project_phases and GET /project_phases.xml
  #Displays all project phases
  def index
    @project_phases = ProjectPhase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_phases }
    end
  end

  # Triggered by GET /project_phases/1 and GET /project_phases/1.xml
  # Show the project phase specified by the user
  def show
    @project_phase = ProjectPhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_phase }
    end
  end

  # Triggered by GET /project_phases/new and GET /project_phases/new.xml
  # Display the project creation form to the user.
  def new
    @project_phase = ProjectPhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_phase }
    end
  end

  # Triggered by GET /project_phases/1/edit
  # Display the project edit form
  def edit
    @project_phase = ProjectPhase.find(params[:id])
  end

  # Triggered by POST /project_phases and POST /project_phases.xml
  # Receive the parameters from client side and create a new Project phase.
  def create
    @project_phase = ProjectPhase.new(params[:project_phase])

    respond_to do |format|
      if @project_phase.save
        format.html { redirect_to(@project_phase, :notice => 'Project phase was successfully created.') }
        format.xml  { render :xml => @project_phase, :status => :created, :location => @project_phase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by PUT /project_phases/1 and PUT /project_phases/1.xml
  # Receive the parameters from client side and update a Project Phase.
  def update
    @project_phase = ProjectPhase.find(params[:id])

    respond_to do |format|
      if @project_phase.update_attributes(params[:project_phase])
        format.html { redirect_to(@project_phase, :notice => 'Project phase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by DELETE /project_phases/1 and DELETE /project_phases/1.xml
  # Delete a project phase
  def destroy
    @project_phase = ProjectPhase.find(params[:id])
    @project_phase.destroy

    respond_to do |format|
      format.html { redirect_to(project_phases_url) }
      format.xml  { head :ok }
    end
  end
end
