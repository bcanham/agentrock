require 'spec_helper'

describe Pages::TermsConditionsController do

  def mock_terms_condition(stubs={})
    @mock_terms_condition ||= mock_model(Pages::TermsCondition, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all pages_terms_conditions as @pages_terms_conditions" do
      Pages::TermsCondition.stub(:all) { [mock_terms_condition] }
      get :index
      assigns(:pages_terms_conditions).should eq([mock_terms_condition])
    end
  end

  describe "GET show" do
    it "assigns the requested terms_condition as @terms_condition" do
      Pages::TermsCondition.stub(:find).with("37") { mock_terms_condition }
      get :show, :id => "37"
      assigns(:terms_condition).should be(mock_terms_condition)
    end
  end

  describe "GET new" do
    it "assigns a new terms_condition as @terms_condition" do
      Pages::TermsCondition.stub(:new) { mock_terms_condition }
      get :new
      assigns(:terms_condition).should be(mock_terms_condition)
    end
  end

  describe "GET edit" do
    it "assigns the requested terms_condition as @terms_condition" do
      Pages::TermsCondition.stub(:find).with("37") { mock_terms_condition }
      get :edit, :id => "37"
      assigns(:terms_condition).should be(mock_terms_condition)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created terms_condition as @terms_condition" do
        Pages::TermsCondition.stub(:new).with({'these' => 'params'}) { mock_terms_condition(:save => true) }
        post :create, :terms_condition => {'these' => 'params'}
        assigns(:terms_condition).should be(mock_terms_condition)
      end

      it "redirects to the created terms_condition" do
        Pages::TermsCondition.stub(:new) { mock_terms_condition(:save => true) }
        post :create, :terms_condition => {}
        response.should redirect_to(pages_terms_condition_url(mock_terms_condition))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved terms_condition as @terms_condition" do
        Pages::TermsCondition.stub(:new).with({'these' => 'params'}) { mock_terms_condition(:save => false) }
        post :create, :terms_condition => {'these' => 'params'}
        assigns(:terms_condition).should be(mock_terms_condition)
      end

      it "re-renders the 'new' template" do
        Pages::TermsCondition.stub(:new) { mock_terms_condition(:save => false) }
        post :create, :terms_condition => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested terms_condition" do
        Pages::TermsCondition.should_receive(:find).with("37") { mock_terms_condition }
        mock_pages_terms_condition.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :terms_condition => {'these' => 'params'}
      end

      it "assigns the requested terms_condition as @terms_condition" do
        Pages::TermsCondition.stub(:find) { mock_terms_condition(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:terms_condition).should be(mock_terms_condition)
      end

      it "redirects to the terms_condition" do
        Pages::TermsCondition.stub(:find) { mock_terms_condition(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pages_terms_condition_url(mock_terms_condition))
      end
    end

    describe "with invalid params" do
      it "assigns the terms_condition as @terms_condition" do
        Pages::TermsCondition.stub(:find) { mock_terms_condition(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:terms_condition).should be(mock_terms_condition)
      end

      it "re-renders the 'edit' template" do
        Pages::TermsCondition.stub(:find) { mock_terms_condition(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested terms_condition" do
      Pages::TermsCondition.should_receive(:find).with("37") { mock_terms_condition }
      mock_pages_terms_condition.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pages_terms_conditions list" do
      Pages::TermsCondition.stub(:find) { mock_terms_condition }
      delete :destroy, :id => "1"
      response.should redirect_to(pages_terms_conditions_url)
    end
  end

end
