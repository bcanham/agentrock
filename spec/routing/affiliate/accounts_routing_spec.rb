require "spec_helper"

describe Affiliate::AccountsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/affiliate_accounts" }.should route_to(:controller => "affiliate_accounts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/affiliate_accounts/new" }.should route_to(:controller => "affiliate_accounts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/affiliate_accounts/1" }.should route_to(:controller => "affiliate_accounts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/affiliate_accounts/1/edit" }.should route_to(:controller => "affiliate_accounts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/affiliate_accounts" }.should route_to(:controller => "affiliate_accounts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/affiliate_accounts/1" }.should route_to(:controller => "affiliate_accounts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/affiliate_accounts/1" }.should route_to(:controller => "affiliate_accounts", :action => "destroy", :id => "1")
    end

  end
end
