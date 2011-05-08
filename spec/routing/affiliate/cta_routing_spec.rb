require "spec_helper"

describe Affiliate::CtaController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/affiliate_cta" }.should route_to(:controller => "affiliate_cta", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/affiliate_cta/new" }.should route_to(:controller => "affiliate_cta", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/affiliate_cta/1" }.should route_to(:controller => "affiliate_cta", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/affiliate_cta/1/edit" }.should route_to(:controller => "affiliate_cta", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/affiliate_cta" }.should route_to(:controller => "affiliate_cta", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/affiliate_cta/1" }.should route_to(:controller => "affiliate_cta", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/affiliate_cta/1" }.should route_to(:controller => "affiliate_cta", :action => "destroy", :id => "1")
    end

  end
end
