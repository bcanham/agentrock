require 'spec_helper'

describe "subdomains/show.html.erb" do
  before(:each) do
    @subdomain = assign(:subdomain, stub_model(Subdomain))
  end

  it "renders attributes in <p>" do
    render
  end
end
