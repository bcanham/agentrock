require "spec_helper"

describe Pages::DynamicPagesController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/pages_dynamic_pages" }.should route_to(:controller => "pages_dynamic_pages", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/pages_dynamic_pages/new" }.should route_to(:controller => "pages_dynamic_pages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pages_dynamic_pages/1" }.should route_to(:controller => "pages_dynamic_pages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pages_dynamic_pages/1/edit" }.should route_to(:controller => "pages_dynamic_pages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pages_dynamic_pages" }.should route_to(:controller => "pages_dynamic_pages", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/pages_dynamic_pages/1" }.should route_to(:controller => "pages_dynamic_pages", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pages_dynamic_pages/1" }.should route_to(:controller => "pages_dynamic_pages", :action => "destroy", :id => "1") 
    end

  end
end
