require 'spec_helper'

describe "notifications/edit.html.erb" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :new_record? => false
    ))
  end

  it "renders the edit notification form" do
    render

    rendered.should have_selector("form", :action => notification_path(@notification), :method => "post") do |form|
    end
  end
end
