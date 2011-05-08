require 'spec_helper'

describe "affiliate_campaigns/edit.html.erb" do
  before(:each) do
    @campaign = assign(:campaign, stub_model(Affiliate::Campaign))
  end

  it "renders the edit campaign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliate_campaigns_path(@campaign), :method => "post" do
    end
  end
end
