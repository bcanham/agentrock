require 'spec_helper'

describe "affiliate_accounts/new.html.erb" do
  before(:each) do
    assign(:account, stub_model(Affiliate::Account).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliate_accounts_path, :method => "post" do
    end
  end
end
