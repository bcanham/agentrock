require "spec_helper"

describe Users::ProfilesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/users_profiles" }.should route_to(:controller => "users_profiles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/users_profiles/new" }.should route_to(:controller => "users_profiles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/users_profiles/1" }.should route_to(:controller => "users_profiles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/users_profiles/1/edit" }.should route_to(:controller => "users_profiles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/users_profiles" }.should route_to(:controller => "users_profiles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/users_profiles/1" }.should route_to(:controller => "users_profiles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/users_profiles/1" }.should route_to(:controller => "users_profiles", :action => "destroy", :id => "1")
    end

  end
end
