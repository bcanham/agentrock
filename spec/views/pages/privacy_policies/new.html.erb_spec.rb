require 'spec_helper'

describe "pages_privacy_policies/new.html.erb" do
  before(:each) do
    assign(:privacy_policy, stub_model(Pages::PrivacyPolicy,
      :new_record? => true
    ))
  end

  it "renders new privacy_policy form" do
    render

    rendered.should have_selector("form", :action => pages_privacy_policies_path, :method => "post") do |form|
    end
  end
end
