require 'spec_helper'

describe Pages::PrivacyPoliciesController do

  def mock_privacy_policy(stubs={})
    @mock_privacy_policy ||= mock_model(Pages::PrivacyPolicy, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all pages_privacy_policies as @pages_privacy_policies" do
      Pages::PrivacyPolicy.stub(:all) { [mock_privacy_policy] }
      get :index
      assigns(:pages_privacy_policies).should eq([mock_privacy_policy])
    end
  end

  describe "GET show" do
    it "assigns the requested privacy_policy as @privacy_policy" do
      Pages::PrivacyPolicy.stub(:find).with("37") { mock_privacy_policy }
      get :show, :id => "37"
      assigns(:privacy_policy).should be(mock_privacy_policy)
    end
  end

  describe "GET new" do
    it "assigns a new privacy_policy as @privacy_policy" do
      Pages::PrivacyPolicy.stub(:new) { mock_privacy_policy }
      get :new
      assigns(:privacy_policy).should be(mock_privacy_policy)
    end
  end

  describe "GET edit" do
    it "assigns the requested privacy_policy as @privacy_policy" do
      Pages::PrivacyPolicy.stub(:find).with("37") { mock_privacy_policy }
      get :edit, :id => "37"
      assigns(:privacy_policy).should be(mock_privacy_policy)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created privacy_policy as @privacy_policy" do
        Pages::PrivacyPolicy.stub(:new).with({'these' => 'params'}) { mock_privacy_policy(:save => true) }
        post :create, :privacy_policy => {'these' => 'params'}
        assigns(:privacy_policy).should be(mock_privacy_policy)
      end

      it "redirects to the created privacy_policy" do
        Pages::PrivacyPolicy.stub(:new) { mock_privacy_policy(:save => true) }
        post :create, :privacy_policy => {}
        response.should redirect_to(pages_privacy_policy_url(mock_privacy_policy))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved privacy_policy as @privacy_policy" do
        Pages::PrivacyPolicy.stub(:new).with({'these' => 'params'}) { mock_privacy_policy(:save => false) }
        post :create, :privacy_policy => {'these' => 'params'}
        assigns(:privacy_policy).should be(mock_privacy_policy)
      end

      it "re-renders the 'new' template" do
        Pages::PrivacyPolicy.stub(:new) { mock_privacy_policy(:save => false) }
        post :create, :privacy_policy => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested privacy_policy" do
        Pages::PrivacyPolicy.should_receive(:find).with("37") { mock_privacy_policy }
        mock_pages_privacy_policy.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :privacy_policy => {'these' => 'params'}
      end

      it "assigns the requested privacy_policy as @privacy_policy" do
        Pages::PrivacyPolicy.stub(:find) { mock_privacy_policy(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:privacy_policy).should be(mock_privacy_policy)
      end

      it "redirects to the privacy_policy" do
        Pages::PrivacyPolicy.stub(:find) { mock_privacy_policy(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pages_privacy_policy_url(mock_privacy_policy))
      end
    end

    describe "with invalid params" do
      it "assigns the privacy_policy as @privacy_policy" do
        Pages::PrivacyPolicy.stub(:find) { mock_privacy_policy(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:privacy_policy).should be(mock_privacy_policy)
      end

      it "re-renders the 'edit' template" do
        Pages::PrivacyPolicy.stub(:find) { mock_privacy_policy(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested privacy_policy" do
      Pages::PrivacyPolicy.should_receive(:find).with("37") { mock_privacy_policy }
      mock_pages_privacy_policy.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pages_privacy_policies list" do
      Pages::PrivacyPolicy.stub(:find) { mock_privacy_policy }
      delete :destroy, :id => "1"
      response.should redirect_to(pages_privacy_policies_url)
    end
  end

end
