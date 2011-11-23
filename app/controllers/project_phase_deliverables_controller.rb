# The project_phase_deliverables_controller manages Project Phase Deliverables.
# Available actions include creation, modification, deletion and show.
# All actions except listing all project phase deliverables and viewing a
# single project phase deliverable require the user to be logged in.

class ProjectPhaseDeliverablesController < ApplicationController
  authorize_resource :class => false
  skip_authorize_resource :only => [:index,:show]

  before_filter :authenticate_user!

  # Triggered by GET /project_phase_deliverables and GET /project_phase_deliverables.xml
  # Display all project phase deliverables
  def index
    @project_phase_deliverables = ProjectPhaseDeliverable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @project_phase_deliverables }
    end
  end

  # Triggered by GET /project_phase_deliverables/1 and GET /project_phase_deliverables/1.xml
  # Show the project phase deliverable chosen by the user
  def show
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])

    respond_to do |format|
      if(params[:no_layout] == "true")
        format.html { render :layout => false}
      else
        format.html # show.html.erb
      end
      format.xml  { render :xml => @project_phase_deliverable }
    end
  end

  # Triggered by GET /project_phase_deliverables/new and GET /project_phase_deliverables/new.xml
  # Display the creation form for a new project phase deliverable
  def new
    @new_project_phase_deliverable = ProjectPhaseDeliverable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new_project_phase_deliverable }
    end
  end

  # Triggered by GET /project_phase_deliverables/1/edit
  # Display the edit form
  def edit
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])
    if(!@project_phase_deliverable.deliverable_type.blank? && !@project_phase_deliverable.complexity.blank?)
      @historical_data = HistoricalData.get_historical_data(@project_phase_deliverable.deliverable_type_id,
                                                            @project_phase_deliverable.complexity)
    end

    respond_to do |format|
      if(!@project_phase_deliverable.has_effort_log?)
        if(params[:no_layout] == "true")
          @no_layout = true
          format.html { render :layout => false}
        else
          format.html # show.html.erb
        end
      else
        format.html { redirect_to(@project_phase_deliverable.project_phase.project, :error => 'You cannot update a deliverable that has logged effort.') }
      end
    end
  end

  # Triggered by POST /project_phase_deliverables and POST /project_phase_deliverables.xml
  # Receive the parameters from client side and create a new project phase deliverable
  def create
    if params[:project_phase_deliverable][:deliverable_type_id] == ""
      #it is ad-hoc
      params[:project_phase_deliverable][:deliverable_type_id] = 0
    end
    @new_project_phase_deliverable = ProjectPhaseDeliverable.new(params[:project_phase_deliverable])

    respond_to do |format|
      if @new_project_phase_deliverable.save
        format.html { redirect_to(@new_project_phase_deliverable.project_phase.project, :notice => 'Project phase deliverable was successfully created.') }
        format.xml  { render :xml => @new_project_phase_deliverable, :status => :created, :location => @new_project_phase_deliverable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @new_project_phase_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by PUT /project_phase_deliverables/1 and PUT /project_phase_deliverables/1.xml
  # Receive the parameters from client side and update the project phase deliverable.
  def update
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])

    respond_to do |format|
      if @project_phase_deliverable.update_attributes(params[:project_phase_deliverable])
        format.html { redirect_to(Project.find(@project_phase_deliverable.project_phase.project), :notice => 'Project phase deliverable was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project_phase_deliverable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Triggered by DELETE /project_phase_deliverables/1 and DELETE /project_phase_deliverables/1.xml
  # Delete the project phase deliverable
  def destroy
    @project_phase_deliverable = ProjectPhaseDeliverable.find(params[:id])
    @project_phase_deliverable.destroy

    respond_to do |format|
      format.html { redirect_to(@project_phase_deliverable.project_phase.project) }
      format.xml  { head :ok }
    end
  end


  # Return the corresponding UoM for a specified DeliverableType

  def getuom
    @deliverable_type = DeliverableType.find(params[:id])
    respond_to do |format|
      format.json { render :json => @deliverable_type.uom}
    end
  end
end
