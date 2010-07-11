require "spec_helper"

describe SubdomainsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/subdomains" }.should route_to(:controller => "subdomains", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/subdomains/new" }.should route_to(:controller => "subdomains", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/subdomains/1" }.should route_to(:controller => "subdomains", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/subdomains/1/edit" }.should route_to(:controller => "subdomains", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/subdomains" }.should route_to(:controller => "subdomains", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/subdomains/1" }.should route_to(:controller => "subdomains", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/subdomains/1" }.should route_to(:controller => "subdomains", :action => "destroy", :id => "1") 
    end

  end
end
