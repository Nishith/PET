require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LifecyclePhasesController do

  # This should return the minimal set of attributes required to create a valid
  # LifecyclePhase. As you add validations to LifecyclePhase, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "Test phase 2", :position => 1, :lifecycle_id => 1}
  end

  before(:each) do
    @admin = Factory(:admin)
    sign_in @admin
    @lifecycle = Factory(:lifecycle)
  end

  describe "GET index" do
    it "assigns all lifecycle_phases as @lifecycle_phases" do
      lifecycle_phase = LifecyclePhase.create! valid_attributes
      get :index
      assigns(:lifecycle_phases).should eq([lifecycle_phase])
    end
  end

  describe "GET show" do
    it "assigns the requested lifecycle_phase as @lifecycle_phase" do
      lifecycle_phase = LifecyclePhase.create! valid_attributes
      get :show, :id => lifecycle_phase.id.to_s
      assigns(:lifecycle_phase).should eq(lifecycle_phase)
    end
  end

  describe "GET new" do
    it "assigns a new lifecycle_phase as @lifecycle_phase" do
      get :new
      assigns(:lifecycle_phase).should be_a_new(LifecyclePhase)
    end
  end

  describe "GET edit" do
    it "assigns the requested lifecycle_phase as @lifecycle_phase" do
      lifecycle_phase = LifecyclePhase.create! valid_attributes
      get :edit, :id => lifecycle_phase.id.to_s
      assigns(:lifecycle_phase).should eq(lifecycle_phase)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LifecyclePhase" do
        expect {
          post :create, :lifecycle_phase => valid_attributes
        }.to change(LifecyclePhase, :count).by(1)
      end

      it "assigns a newly created lifecycle_phase as @lifecycle_phase" do
        post :create, :lifecycle_phase => valid_attributes
        assigns(:lifecycle_phase).should be_a(LifecyclePhase)
        assigns(:lifecycle_phase).should be_persisted
      end

      it "redirects to the lifecycle of the phase" do
        post :create, :lifecycle_phase => valid_attributes
        response.should redirect_to(@lifecycle)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lifecycle_phase as @lifecycle_phase" do
        # Trigger the behavior that occurs when invalid params are submitted
        LifecyclePhase.any_instance.stub(:save).and_return(false)
        post :create, :lifecycle_phase => {}
        assigns(:lifecycle_phase).should be_a_new(LifecyclePhase)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LifecyclePhase.any_instance.stub(:save).and_return(false)
        post :create, :lifecycle_phase => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested lifecycle_phase" do
        lifecycle_phase = LifecyclePhase.create! valid_attributes
        # Assuming there are no other lifecycle_phases in the database, this
        # specifies that the LifecyclePhase created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LifecyclePhase.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => lifecycle_phase.id, :lifecycle_phase => {'these' => 'params'}
      end

      it "assigns the requested lifecycle_phase as @lifecycle_phase" do
        lifecycle_phase = LifecyclePhase.create! valid_attributes
        put :update, :id => lifecycle_phase.id, :lifecycle_phase => valid_attributes
        assigns(:lifecycle_phase).should eq(lifecycle_phase)
      end

      it "redirects to the lifecycle_phase's lifecycle'" do
        lifecycle_phase = LifecyclePhase.create! valid_attributes
        put :update, :id => lifecycle_phase.id, :lifecycle_phase => valid_attributes
        response.should redirect_to(lifecycle_phase.lifecycle)
      end
    end

    describe "with invalid params" do
      it "assigns the lifecycle_phase as @lifecycle_phase" do
        lifecycle_phase = LifecyclePhase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LifecyclePhase.any_instance.stub(:save).and_return(false)
        put :update, :id => lifecycle_phase.id.to_s, :lifecycle_phase => {}
        assigns(:lifecycle_phase).should eq(lifecycle_phase)
      end

      it "re-renders the 'edit' template" do
        lifecycle_phase = LifecyclePhase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LifecyclePhase.any_instance.stub(:save).and_return(false)
        put :update, :id => lifecycle_phase.id.to_s, :lifecycle_phase => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested lifecycle_phase" do
      lifecycle_phase = LifecyclePhase.create! valid_attributes
      expect {
        delete :destroy, :id => lifecycle_phase.id.to_s
      }.to change(LifecyclePhase, :count).by(-1)
    end

    it "redirects to the lifecycle_phase's lifecycle" do
      lifecycle_phase = LifecyclePhase.create! valid_attributes
      delete :destroy, :id => lifecycle_phase.id.to_s
      response.should redirect_to(lifecycle_phase.lifecycle)
    end
  end

end
