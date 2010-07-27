require 'spec_helper'

describe "pages_dynamic_pages/edit.html.erb" do
  before(:each) do
    @dynamic_page = assign(:dynamic_page, stub_model(Pages::DynamicPage,
      :new_record? => false
    ))
  end

  it "renders the edit dynamic_page form" do
    render

    rendered.should have_selector("form", :action => dynamic_page_path(@dynamic_page), :method => "post") do |form|
    end
  end
end
