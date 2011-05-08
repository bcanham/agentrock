require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe Affiliate::CtaController do

  def mock_ctum(stubs={})
    @mock_ctum ||= mock_model(Affiliate::Ctum, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all affiliate_cta as @affiliate_cta" do
      Affiliate::Ctum.stub(:all) { [mock_ctum] }
      get :index
      assigns(:affiliate_cta).should eq([mock_ctum])
    end
  end

  describe "GET show" do
    it "assigns the requested ctum as @ctum" do
      Affiliate::Ctum.stub(:find).with("37") { mock_ctum }
      get :show, :id => "37"
      assigns(:ctum).should be(mock_ctum)
    end
  end

  describe "GET new" do
    it "assigns a new ctum as @ctum" do
      Affiliate::Ctum.stub(:new) { mock_ctum }
      get :new
      assigns(:ctum).should be(mock_ctum)
    end
  end

  describe "GET edit" do
    it "assigns the requested ctum as @ctum" do
      Affiliate::Ctum.stub(:find).with("37") { mock_ctum }
      get :edit, :id => "37"
      assigns(:ctum).should be(mock_ctum)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created ctum as @ctum" do
        Affiliate::Ctum.stub(:new).with({'these' => 'params'}) { mock_ctum(:save => true) }
        post :create, :ctum => {'these' => 'params'}
        assigns(:ctum).should be(mock_ctum)
      end

      it "redirects to the created ctum" do
        Affiliate::Ctum.stub(:new) { mock_ctum(:save => true) }
        post :create, :ctum => {}
        response.should redirect_to(affiliate_ctum_url(mock_ctum))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ctum as @ctum" do
        Affiliate::Ctum.stub(:new).with({'these' => 'params'}) { mock_ctum(:save => false) }
        post :create, :ctum => {'these' => 'params'}
        assigns(:ctum).should be(mock_ctum)
      end

      it "re-renders the 'new' template" do
        Affiliate::Ctum.stub(:new) { mock_ctum(:save => false) }
        post :create, :ctum => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ctum" do
        Affiliate::Ctum.stub(:find).with("37") { mock_ctum }
        mock_affiliate_ctum.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ctum => {'these' => 'params'}
      end

      it "assigns the requested ctum as @ctum" do
        Affiliate::Ctum.stub(:find) { mock_ctum(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:ctum).should be(mock_ctum)
      end

      it "redirects to the ctum" do
        Affiliate::Ctum.stub(:find) { mock_ctum(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(affiliate_ctum_url(mock_ctum))
      end
    end

    describe "with invalid params" do
      it "assigns the ctum as @ctum" do
        Affiliate::Ctum.stub(:find) { mock_ctum(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:ctum).should be(mock_ctum)
      end

      it "re-renders the 'edit' template" do
        Affiliate::Ctum.stub(:find) { mock_ctum(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ctum" do
      Affiliate::Ctum.stub(:find).with("37") { mock_ctum }
      mock_affiliate_ctum.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the affiliate_cta list" do
      Affiliate::Ctum.stub(:find) { mock_ctum }
      delete :destroy, :id => "1"
      response.should redirect_to(affiliate_cta_url)
    end
  end

end