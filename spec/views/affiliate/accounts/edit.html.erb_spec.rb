require 'spec_helper'

describe "affiliate_accounts/edit.html.erb" do
  before(:each) do
    @account = assign(:account, stub_model(Affiliate::Account))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliate_accounts_path(@account), :method => "post" do
    end
  end
end
