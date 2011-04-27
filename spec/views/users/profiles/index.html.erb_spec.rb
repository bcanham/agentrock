require 'spec_helper'

describe "users_profiles/index.html.erb" do
  before(:each) do
    assign(:users_profiles, [
      stub_model(Users::Profile),
      stub_model(Users::Profile)
    ])
  end

  it "renders a list of users_profiles" do
    render
  end
end
