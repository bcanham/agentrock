require 'spec_helper'

describe "activities/edit.html.erb" do
  before(:each) do
    assign(:activity, @activity = stub_model(Activity,
      :new_record? => false
    ))
  end

  it "renders the edit activity form" do
    render

    rendered.should have_selector("form", :action => activity_path(@activity), :method => "post") do |form|
    end
  end
end
