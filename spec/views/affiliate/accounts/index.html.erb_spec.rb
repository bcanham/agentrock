require 'spec_helper'

describe "affiliate_accounts/index.html.erb" do
  before(:each) do
    assign(:affiliate_accounts, [
      stub_model(Affiliate::Account),
      stub_model(Affiliate::Account)
    ])
  end

  it "renders a list of affiliate_accounts" do
    render
  end
end
