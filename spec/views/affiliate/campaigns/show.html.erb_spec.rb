require 'spec_helper'

describe "affiliate_campaigns/show.html.erb" do
  before(:each) do
    @campaign = assign(:campaign, stub_model(Affiliate::Campaign))
  end

  it "renders attributes in <p>" do
    render
  end
end
