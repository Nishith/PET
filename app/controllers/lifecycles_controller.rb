class LifecyclesController < ApplicationController
  before_filter :authenticate_user!

  # GET /lifecycles
  # GET /lifecycles.xml
  def index
    @lifecycles = Lifecycle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lifecycles }
    end
  end

  # GET /lifecycles/1
  # GET /lifecycles/1.xml
  def show
    @lifecycle = Lifecycle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lifecycle }
    end
  end

  # GET /lifecycles/new
  # GET /lifecycles/new.xml
  def new
    @lifecycle = Lifecycle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lifecycle }
    end
  end

  # GET /lifecycles/1/edit
  def edit
    @lifecycle = Lifecycle.find(params[:id])
  end

  # POST /lifecycles
  # POST /lifecycles.xml
  def create
    @lifecycle = Lifecycle.new(params[:lifecycle])

    respond_to do |format|
      if @lifecycle.save
        format.html { redirect_to(@lifecycle, :notice => 'Lifecycle was successfully created.') }
        format.xml  { render :xml => @lifecycle, :status => :created, :location => @lifecycle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lifecycle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lifecycles/1
  # PUT /lifecycles/1.xml
  def update
    @lifecycle = Lifecycle.find(params[:id])

    respond_to do |format|
      if @lifecycle.update_attributes(params[:lifecycle])
        format.html { redirect_to(@lifecycle, :notice => 'Lifecycle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lifecycle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lifecycles/1
  # DELETE /lifecycles/1.xml
  def destroy
    @lifecycle = Lifecycle.find(params[:id])
    @lifecycle.destroy

    respond_to do |format|
      format.html { redirect_to(lifecycles_url) }
      format.xml  { head :ok }
    end
  end
end
