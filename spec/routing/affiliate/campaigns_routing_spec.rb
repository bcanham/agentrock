require "spec_helper"

describe Affiliate::CampaignsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/affiliate_campaigns" }.should route_to(:controller => "affiliate_campaigns", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/affiliate_campaigns/new" }.should route_to(:controller => "affiliate_campaigns", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/affiliate_campaigns/1" }.should route_to(:controller => "affiliate_campaigns", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/affiliate_campaigns/1/edit" }.should route_to(:controller => "affiliate_campaigns", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/affiliate_campaigns" }.should route_to(:controller => "affiliate_campaigns", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/affiliate_campaigns/1" }.should route_to(:controller => "affiliate_campaigns", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/affiliate_campaigns/1" }.should route_to(:controller => "affiliate_campaigns", :action => "destroy", :id => "1")
    end

  end
end
