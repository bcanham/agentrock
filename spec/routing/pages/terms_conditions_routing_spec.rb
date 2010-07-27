require "spec_helper"

describe Pages::TermsConditionsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/pages_terms_conditions" }.should route_to(:controller => "pages_terms_conditions", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/pages_terms_conditions/new" }.should route_to(:controller => "pages_terms_conditions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pages_terms_conditions/1" }.should route_to(:controller => "pages_terms_conditions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pages_terms_conditions/1/edit" }.should route_to(:controller => "pages_terms_conditions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pages_terms_conditions" }.should route_to(:controller => "pages_terms_conditions", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pages_terms_conditions/1" }.should route_to(:controller => "pages_terms_conditions", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pages_terms_conditions/1" }.should route_to(:controller => "pages_terms_conditions", :action => "destroy", :id => "1")
    end

  end
end
