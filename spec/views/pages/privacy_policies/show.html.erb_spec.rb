require 'spec_helper'

describe "pages_privacy_policies/show.html.erb" do
  before(:each) do
    @privacy_policy = assign(:privacy_policy, stub_model(Pages::PrivacyPolicy))
  end

  it "renders attributes in <p>" do
    render
  end
end
