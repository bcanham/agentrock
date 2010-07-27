require 'spec_helper'

describe "pages_dynamic_pages/index.html.erb" do
  before(:each) do
    assign(:pages_dynamic_pages, [
      stub_model(Pages::DynamicPage),
      stub_model(Pages::DynamicPage)
    ])
  end

  it "renders a list of pages_dynamic_pages" do
    render
  end
end
