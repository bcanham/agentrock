require 'spec_helper'

describe "discussions/index.html.erb" do
  before(:each) do
    assign(:discussions, [
      stub_model(Discussion),
      stub_model(Discussion)
    ])
  end

  it "renders a list of discussions" do
    render
  end
end
