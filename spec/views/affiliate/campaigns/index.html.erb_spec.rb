require 'spec_helper'

describe "affiliate_campaigns/index.html.erb" do
  before(:each) do
    assign(:affiliate_campaigns, [
      stub_model(Affiliate::Campaign),
      stub_model(Affiliate::Campaign)
    ])
  end

  it "renders a list of affiliate_campaigns" do
    render
  end
end
