require 'spec_helper'

describe "users_profiles/edit.html.erb" do
  before(:each) do
    @profile = assign(:profile, stub_model(Users::Profile))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_profiles_path(@profile), :method => "post" do
    end
  end
end
