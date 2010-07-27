require 'spec_helper'

describe "pages_privacy_policies/index.html.erb" do
  before(:each) do
    assign(:pages_privacy_policies, [
      stub_model(Pages::PrivacyPolicy),
      stub_model(Pages::PrivacyPolicy)
    ])
  end

  it "renders a list of pages_privacy_policies" do
    render
  end
end
