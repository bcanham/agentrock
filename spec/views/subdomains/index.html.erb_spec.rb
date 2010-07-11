require 'spec_helper'

describe "subdomains/index.html.erb" do
  before(:each) do
    assign(:subdomains, [
      stub_model(Subdomain),
      stub_model(Subdomain)
    ])
  end

  it "renders a list of subdomains" do
    render
  end
end
