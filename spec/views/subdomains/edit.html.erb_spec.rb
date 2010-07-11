require 'spec_helper'

describe "subdomains/edit.html.erb" do
  before(:each) do
    @subdomain = assign(:subdomain, stub_model(Subdomain,
      :new_record? => false
    ))
  end

  it "renders the edit subdomain form" do
    render

    rendered.should have_selector("form", :action => subdomain_path(@subdomain), :method => "post") do |form|
    end
  end
end
