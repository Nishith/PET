require "spec_helper"

describe Users::InvitationsController do

  let(:developer){ Factory(:developer) }
  let(:admin){ Factory(:admin) }
  let(:manager){ Factory(:manager) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  ["admin", "manager"].each do |role|
    it "admin should be able to access the invitation page" do
      sign_in eval(role)
      get 'new'
      response.should be_success
    end

  #it "manager should be able to access the invitation page" do
  #  sign_in manager
  #  get 'new'
  #  response.should be_success
  #end

    it "should assign user role when inviting for #{role}" do
      sign_in eval(role)
      post 'create', :user => {:email => "asd@asd.com", :role =>"admin"}, :skip_invitation => true
      assigns[:user].role.should eq "admin"
    end

    it "should redirect to user index when inviting for #{role}" do
      sign_in eval(role)
      post 'create', :user => {:email => "asd@asd.com", :password => "123456", :role => "admin", :name => "Asd"}, :skip_invitation => true
      response.should redirect_to('/users')
    end
  #
  #it "should assign user role when inviting for manager" do
  #  sign_in manager
  #  post 'create', :user => {:email => "asd@asd.com", :role =>"admin"}, :skip_invitation => true
  #  assigns[:user].role.should eq "admin"
  #end
  #
  #it "should redirect to user index when inviting for manager" do
  #  sign_in manager
  #  post 'create', :user => {:email => "asd@asd.com", :password => "123456", :role => "admin", :name => "Asd"}, :skip_invitation => true
  #  response.should redirect_to('/users')
  #end
  end

  it "should not be able to access send invitation page" do
    get 'new'
    response.should_not be_success
  end

  it "should be able to access accept invitation page with invitation token" do
    @user = User.invite!(:email => "new_user@example.com", :name => "Test", :role => "admin", :skip_invitation => false)
    get 'edit', :invitation_token => @user.invitation_token
    response.should be_success
  end

  it "should not be able to access accept invitation page without token" do
    get 'edit'
    response.should_not be_success
  end

  it "should not be able to access accept invitation page with invalid token" do
    get 'edit', :invitation_token => 'test'
    response.should_not be_success
  end

  it "when accepting the invitation the loaded user includes the role assigned" do
    @user = User.invite!(:email => "new_user@example.com", :name => "Test", :role => "admin", :skip_invitation => false)
    get 'edit', :invitation_token => @user.invitation_token
    assigns[:user].role.should eq "admin"
  end

  it "should not be able to access send invitation page" do
    sign_in developer
    get 'new'
    response.should_not be_success
  end

end