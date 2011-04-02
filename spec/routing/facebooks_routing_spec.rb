require "spec_helper"

describe FacebooksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/facebooks" }.should route_to(:controller => "facebooks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/facebooks/new" }.should route_to(:controller => "facebooks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/facebooks/1" }.should route_to(:controller => "facebooks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/facebooks/1/edit" }.should route_to(:controller => "facebooks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/facebooks" }.should route_to(:controller => "facebooks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/facebooks/1" }.should route_to(:controller => "facebooks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/facebooks/1" }.should route_to(:controller => "facebooks", :action => "destroy", :id => "1")
    end

  end
end
