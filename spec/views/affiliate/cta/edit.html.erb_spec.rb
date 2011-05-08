require 'spec_helper'

describe "affiliate_cta/edit.html.erb" do
  before(:each) do
    @ctum = assign(:ctum, stub_model(Affiliate::Ctum))
  end

  it "renders the edit ctum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliate_cta_path(@ctum), :method => "post" do
    end
  end
end
