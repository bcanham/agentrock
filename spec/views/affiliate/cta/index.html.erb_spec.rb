require 'spec_helper'

describe "affiliate_cta/index.html.erb" do
  before(:each) do
    assign(:affiliate_cta, [
      stub_model(Affiliate::Ctum),
      stub_model(Affiliate::Ctum)
    ])
  end

  it "renders a list of affiliate_cta" do
    render
  end
end
