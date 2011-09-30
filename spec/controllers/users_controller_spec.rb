require 'spec_helper'

describe UsersController do

  let(:developer){ Factory(:developer) }
  let(:admin){ Factory(:admin) }
  let(:manager){ Factory(:manager) }

  describe "GET 'index'" do
    it "should be successful" do
      sign_in developer
      get 'index'
      response.should be_success
    end

    it "should list users: name, email and roles"

    it "should not be able to access sign up page" do
      {:get => 'sign_up'}.should_not be_routable
    end

  end

end
