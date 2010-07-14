require 'spec_helper'

describe "discussions/edit.html.erb" do
  before(:each) do
    @discussion = assign(:discussion, stub_model(Discussion,
      :new_record? => false
    ))
  end

  it "renders the edit discussion form" do
    render

    rendered.should have_selector("form", :action => discussion_path(@discussion), :method => "post") do |form|
    end
  end
end
