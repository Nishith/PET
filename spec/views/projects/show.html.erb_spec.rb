require 'spec_helper'

describe "projects/show.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "",
      :description => "MyText",
      :lifecycle_id => 1
    ))
  end

end
