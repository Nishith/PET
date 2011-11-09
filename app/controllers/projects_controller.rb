# The projects controller manages Projects.
# Available actions include creation, modification, deletion and show.
# All actions except listing all projects and viewing a single project
# require the user to be logged in.

class ProjectsController < ApplicationController
  authorize_resource :class => false
  skip_authorize_resource :only => [:index,:show]

  before_filter :authenticate_user!

  # Triggered by GET /projects and GET /projects.xml
  # Display all projects
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # Triggered by GET /projects/1 and GET /projects/1.xml
  # Show the project specified by the user
  def show
    @projects = Project.all
    @project = Project.find(params[:id])
    @new_project = Project.new

    @project_phase = ProjectPhase.new
    @project_phase.project_id = @project.id
    number_of_phases = ProjectPhase.find_all_by_project_id(@project.id).size
    @project_phase.position = number_of_phases + 1

    @new_project_phase_deliverable = ProjectPhaseDeliverable.new



    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # Triggered by GET /projects/new and GET /projects/new.xml
  # Display the creation form for the users to create a new project
  def new
    @new_project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new_project }
    end
  end

  # Triggered by GET /projects/1/edit
  # Display the editing form
  def edit
    @project = Project.find(params[:id])
  end

  # Triggered by POST /projects and POST /projects.xml
  # Receive the parameters from client side and create a new Project.
  def create
    @new_project = Project.new(params[:project])
    if @new_project.lifecycle_name == "" then
      @new_project.lifecycle_name = "None"
    end
    
    @new_project.save

    lf_names = Lifecycle.find(:all, :select => "name")
    lf_name_array = []
    lf_names.each do |lfn|
      lf_name_array << lfn.name
    end
    
    if(lf_name_array.include? @new_project.lifecycle_name) then
      #want to copy all data from the lifecycle to the project
      lf = Lifecycle.find_all_by_name(@new_project.lifecycle_name).last
      lf.lifecycle_phases.each do |lf_phase|
        pf = ProjectPhase.new(:name => lf_phase.name, :description => lf_phase.description, :project_id => @new_project.id,
          :position => lf_phase.position)
        pf.save

        lf_phase.lifecycle_phase_deliverables.each do |lf_ph_deliverable|
          name = lf_ph_deliverable.deliverable_type.blank?? "None" : lf_ph_deliverable.deliverable_type.name
          deliverable = ProjectPhaseDeliverable.new(:description => lf_ph_deliverable.description,
                                                    :name => name,
                                                    :uom_id => lf_ph_deliverable.uom_id,
                                                    :deliverable_type_id => lf_ph_deliverable.deliverable_type_id,
                                                    :project_phase_id => pf.id,
                                                    :position => lf_ph_deliverable.position)
          deliverable.save
        end
      end
    end



    respond_to do |format|
      if @new_project.save
        format.html { redirect_to(@new_project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @new_project, :status => :created, :location => @new_project }
      else
        format.html { render :action => "new"}
        format.xml  { render :xml => @new_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by PUT /projects/1 and PUT /projects/1.xml
  # Receive the parameters from client side and update the Project.
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by DELETE /projects/1 and DELETE /projects/1.xml
  # Delete a project
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end

  # receive the ajax query from project#show page and remember the order of phases in database
  # Note: If at some point there are restrictions to the projects that a manager can view,
  # this validation has to be added to this method so that the phases all belong to the
  # same project and that the user has edit permissions on that project.

  def sort
    if params['phase'].is_a? Array
      params['phase'].each do |phase|
        @phase = ProjectPhase.find(phase)
        @phase.update_attribute("position",params['phase'].index(@phase.id.to_s) + 1)
      end
      respond_to do |format|
        format.json { head :ok }
      end
    end
  end
end
