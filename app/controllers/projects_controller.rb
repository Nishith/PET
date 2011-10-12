class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
    @new_project = Project.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
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
        pf = ProjectPhase.new(:name => lf_phase.name, :description => lf_phase.description, :project_id => @new_project.id)
        pf.save

        lf_phase.lifecycle_phase_deliverables.each do |lf_ph_deliverable|
          deliverable = ProjectPhaseDeliverable.new(:description => lf_ph_deliverable.description,
                                                    :uom_id => lf_ph_deliverable.uom_id,
                                                    :deliverable_type_id => lf_ph_deliverable.deliverable_type_id,
                                                    :project_phase_id => pf.id)
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

  # PUT /projects/1
  # PUT /projects/1.xml
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

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
