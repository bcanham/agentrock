require "spec_helper"

describe DiscussionsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/discussions" }.should route_to(:controller => "discussions", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/discussions/new" }.should route_to(:controller => "discussions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/discussions/1" }.should route_to(:controller => "discussions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/discussions/1/edit" }.should route_to(:controller => "discussions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/discussions" }.should route_to(:controller => "discussions", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/discussions/1" }.should route_to(:controller => "discussions", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/discussions/1" }.should route_to(:controller => "discussions", :action => "destroy", :id => "1") 
    end

  end
end
