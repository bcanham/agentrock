require 'spec_helper'

describe "affiliate_cta/show.html.erb" do
  before(:each) do
    @ctum = assign(:ctum, stub_model(Affiliate::Ctum))
  end

  it "renders attributes in <p>" do
    render
  end
end
