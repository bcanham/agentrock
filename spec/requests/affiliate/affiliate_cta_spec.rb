require 'spec_helper'

describe "Affiliate::Cta" do
  describe "GET /affiliate_cta" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get affiliate_cta_path
      response.status.should be(200)
    end
  end
end
