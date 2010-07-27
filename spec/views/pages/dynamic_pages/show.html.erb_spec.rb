require 'spec_helper'

describe "pages_dynamic_pages/show.html.erb" do
  before(:each) do
    @dynamic_page = assign(:dynamic_page, stub_model(Pages::DynamicPage))
  end

  it "renders attributes in <p>" do
    render
  end
end
