require 'spec_helper'

describe "users_profiles/new.html.erb" do
  before(:each) do
    assign(:profile, stub_model(Users::Profile).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_profiles_path, :method => "post" do
    end
  end
end
