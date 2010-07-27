require 'spec_helper'

describe "notifications/new.html.erb" do
  before(:each) do
    assign(:notification, stub_model(Notification,
      :new_record? => true
    ))
  end

  it "renders new notification form" do
    render

    rendered.should have_selector("form", :action => notifications_path, :method => "post") do |form|
    end
  end
end
