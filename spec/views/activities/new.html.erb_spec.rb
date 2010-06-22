require 'spec_helper'

describe "activities/new.html.erb" do
  before(:each) do
    assign(:activity, stub_model(Activity,
      :new_record? => true
    ))
  end

  it "renders new activity form" do
    render

    rendered.should have_selector("form", :action => activities_path, :method => "post") do |form|
    end
  end
end
