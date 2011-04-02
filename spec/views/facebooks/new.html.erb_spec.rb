require 'spec_helper'

describe "facebooks/new.html.erb" do
  before(:each) do
    assign(:facebook, stub_model(Facebook).as_new_record)
  end

  it "renders new facebook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => facebooks_path, :method => "post" do
    end
  end
end
