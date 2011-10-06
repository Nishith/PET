require 'spec_helper'

describe "lifecycles/new.html.erb" do
  before(:each) do
    assign(:lifecycle, stub_model(Lifecycle,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new lifecycle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lifecycles_path, :method => "post" do
      assert_select "input#lifecycle_name", :name => "lifecycle[name]"
      assert_select "textarea#lifecycle_description", :name => "lifecycle[description]"
    end
  end
end
