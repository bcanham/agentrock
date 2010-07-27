require 'spec_helper'

describe "pages_dynamic_pages/new.html.erb" do
  before(:each) do
    assign(:dynamic_page, stub_model(Pages::DynamicPage,
      :new_record? => true
    ))
  end

  it "renders new dynamic_page form" do
    render

    rendered.should have_selector("form", :action => pages_dynamic_pages_path, :method => "post") do |form|
    end
  end
end
