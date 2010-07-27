require "spec_helper"

describe Admin::ArticlesController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/admin_articles" }.should route_to(:controller => "admin_articles", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/admin_articles/new" }.should route_to(:controller => "admin_articles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_articles/1" }.should route_to(:controller => "admin_articles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_articles/1/edit" }.should route_to(:controller => "admin_articles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_articles" }.should route_to(:controller => "admin_articles", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/admin_articles/1" }.should route_to(:controller => "admin_articles", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_articles/1" }.should route_to(:controller => "admin_articles", :action => "destroy", :id => "1") 
    end

  end
end
