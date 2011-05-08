require 'spec_helper'

describe "affiliate_accounts/show.html.erb" do
  before(:each) do
    @account = assign(:account, stub_model(Affiliate::Account))
  end

  it "renders attributes in <p>" do
    render
  end
end
