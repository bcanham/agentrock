require 'spec_helper'

describe "subdomains/new.html.erb" do
  before(:each) do
    assign(:subdomain, stub_model(Subdomain,
      :new_record? => true
    ))
  end

  it "renders new subdomain form" do
    render

    rendered.should have_selector("form", :action => subdomains_path, :method => "post") do |form|
    end
  end
end
