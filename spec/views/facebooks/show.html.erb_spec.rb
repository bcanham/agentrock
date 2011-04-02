require 'spec_helper'

describe "facebooks/show.html.erb" do
  before(:each) do
    @facebook = assign(:facebook, stub_model(Facebook))
  end

  it "renders attributes in <p>" do
    render
  end
end
