require 'spec_helper'

describe "pages_privacy_policies/edit.html.erb" do
  before(:each) do
    @privacy_policy = assign(:privacy_policy, stub_model(Pages::PrivacyPolicy,
      :new_record? => false
    ))
  end

  it "renders the edit privacy_policy form" do
    render

    rendered.should have_selector("form", :action => privacy_policy_path(@privacy_policy), :method => "post") do |form|
    end
  end
end
