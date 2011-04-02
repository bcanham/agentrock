require 'spec_helper'

describe "facebooks/index.html.erb" do
  before(:each) do
    assign(:facebooks, [
      stub_model(Facebook),
      stub_model(Facebook)
    ])
  end

  it "renders a list of facebooks" do
    render
  end
end
