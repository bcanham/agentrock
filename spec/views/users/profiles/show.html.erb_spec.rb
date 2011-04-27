require 'spec_helper'

describe "users_profiles/show.html.erb" do
  before(:each) do
    @profile = assign(:profile, stub_model(Users::Profile))
  end

  it "renders attributes in <p>" do
    render
  end
end
