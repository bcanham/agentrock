require 'spec_helper'

describe "discussions/show.html.erb" do
  before(:each) do
    @discussion = assign(:discussion, stub_model(Discussion))
  end

  it "renders attributes in <p>" do
    render
  end
end
