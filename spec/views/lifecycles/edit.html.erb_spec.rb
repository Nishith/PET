require 'spec_helper'

describe "lifecycles/edit.html.erb" do
  before(:each) do
    @lifecycle = assign(:lifecycle, stub_model(Lifecycle,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit lifecycle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lifecycles_path(@lifecycle), :method => "post" do
      assert_select "input#lifecycle_name", :name => "lifecycle[name]"
      assert_select "textarea#lifecycle_description", :name => "lifecycle[description]"
    end
  end
end
