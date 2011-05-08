require 'spec_helper'

describe "affiliate_cta/new.html.erb" do
  before(:each) do
    assign(:ctum, stub_model(Affiliate::Ctum).as_new_record)
  end

  it "renders new ctum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliate_cta_path, :method => "post" do
    end
  end
end
