require "spec_helper"

describe Pages::PrivacyPoliciesController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/pages_privacy_policies" }.should route_to(:controller => "pages_privacy_policies", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/pages_privacy_policies/new" }.should route_to(:controller => "pages_privacy_policies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pages_privacy_policies/1" }.should route_to(:controller => "pages_privacy_policies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pages_privacy_policies/1/edit" }.should route_to(:controller => "pages_privacy_policies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pages_privacy_policies" }.should route_to(:controller => "pages_privacy_policies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pages_privacy_policies/1" }.should route_to(:controller => "pages_privacy_policies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pages_privacy_policies/1" }.should route_to(:controller => "pages_privacy_policies", :action => "destroy", :id => "1")
    end

  end
end
