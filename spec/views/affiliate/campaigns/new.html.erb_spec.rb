require 'spec_helper'

describe "affiliate_campaigns/new.html.erb" do
  before(:each) do
    assign(:campaign, stub_model(Affiliate::Campaign).as_new_record)
  end

  it "renders new campaign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliate_campaigns_path, :method => "post" do
    end
  end
end
