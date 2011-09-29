require 'spec_helper'

describe UserController do

  let(:developer){ Factory(:developer) }
  let(:admin){ Factory(:admin) }
  let(:manager){ Factory(:manager) }

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should list users: name, email and roles"

    it "should not be able to access sign up page" do
      get 'sign_up'
      response.should_not be_success
    end

    context "guest" do
      it "should not be able to access send invitation page" do
        get 'invitation/new'
        response.should_not be_success
      end
    end

    context "developer" do
      it "should not be able to access send invitation page" do
        get 'invitation/new'
        response.should_not be_success
      end
    end


  end

end
