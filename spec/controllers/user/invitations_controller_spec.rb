require "spec_helper"

describe User::InvitationsController do

  before(:each) do
    @admin = User.create(:email => "tesa@asd.com", :password => "123456", :name => "Tesa", :role => "admin")
    @developer = User.create(:email => "tesD@asd.com", :password => "123456", :name => "Tesa", :role => "developer")
    @manager = User.create(:email => "tesM@asd.com", :password => "123456", :name => "Tesa", :role => "manager")

    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  context "admin and manager" do
    it "admin should be able to access the invitation page" do
      sign_in @admin
      get 'new'
      response.should be_success
    end

    it "manager should be able to access the invitation page" do
      sign_in @manager
      get 'new'
      response.should be_success
    end

    it "should assign user role when inviting" do
      sign_in @admin
      post 'create', :user => {:email => "asd@asd.com"}, :role => "admin", :skip_invitation => true
      assigns[:user].role.should eq "admin"
    end

    it "should redirect to user index" do
      sign_in @admin
      post 'create', :user => {:email => "asd@asd.com", :password => "123456", :role => "admin", :name => "Asd"}, :skip_invitation => true
      response.should redirect_to('/users')
    end
  end

  context "guest" do
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
  end

  context "developer" do
    it "should not be able to access send invitation page" do
      sign_in @developer
      get 'new'
      response.should_not be_success
    end
  end

end