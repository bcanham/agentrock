require 'spec_helper'

describe "discussions/new.html.erb" do
  before(:each) do
    assign(:discussion, stub_model(Discussion,
      :new_record? => true
    ))
  end

  it "renders new discussion form" do
    render

    rendered.should have_selector("form", :action => discussions_path, :method => "post") do |form|
    end
  end
end
