require 'spec_helper'

describe "facebooks/edit.html.erb" do
  before(:each) do
    @facebook = assign(:facebook, stub_model(Facebook))
  end

  it "renders the edit facebook form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => facebooks_path(@facebook), :method => "post" do
    end
  end
end
