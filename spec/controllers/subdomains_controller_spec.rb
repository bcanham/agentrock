require 'spec_helper'

describe SubdomainsController do

  def mock_subdomain(stubs={})
    @mock_subdomain ||= mock_model(Subdomain, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all subdomains as @subdomains" do
      Subdomain.stub(:all) { [mock_subdomain] }
      get :index
      assigns(:subdomains).should eq([mock_subdomain])
    end
  end

  describe "GET show" do
    it "assigns the requested subdomain as @subdomain" do
      Subdomain.stub(:find).with("37") { mock_subdomain }
      get :show, :id => "37"
      assigns(:subdomain).should be(mock_subdomain)
    end
  end

  describe "GET new" do
    it "assigns a new subdomain as @subdomain" do
      Subdomain.stub(:new) { mock_subdomain }
      get :new
      assigns(:subdomain).should be(mock_subdomain)
    end
  end

  describe "GET edit" do
    it "assigns the requested subdomain as @subdomain" do
      Subdomain.stub(:find).with("37") { mock_subdomain }
      get :edit, :id => "37"
      assigns(:subdomain).should be(mock_subdomain)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created subdomain as @subdomain" do
        Subdomain.stub(:new).with({'these' => 'params'}) { mock_subdomain(:save => true) }
        post :create, :subdomain => {'these' => 'params'}
        assigns(:subdomain).should be(mock_subdomain)
      end

      it "redirects to the created subdomain" do
        Subdomain.stub(:new) { mock_subdomain(:save => true) }
        post :create, :subdomain => {}
        response.should redirect_to(subdomain_url(mock_subdomain))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subdomain as @subdomain" do
        Subdomain.stub(:new).with({'these' => 'params'}) { mock_subdomain(:save => false) }
        post :create, :subdomain => {'these' => 'params'}
        assigns(:subdomain).should be(mock_subdomain)
      end

      it "re-renders the 'new' template" do
        Subdomain.stub(:new) { mock_subdomain(:save => false) }
        post :create, :subdomain => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested subdomain" do
        Subdomain.should_receive(:find).with("37") { mock_subdomain }
        mock_subdomain.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :subdomain => {'these' => 'params'}
      end

      it "assigns the requested subdomain as @subdomain" do
        Subdomain.stub(:find) { mock_subdomain(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:subdomain).should be(mock_subdomain)
      end

      it "redirects to the subdomain" do
        Subdomain.stub(:find) { mock_subdomain(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(subdomain_url(mock_subdomain))
      end
    end

    describe "with invalid params" do
      it "assigns the subdomain as @subdomain" do
        Subdomain.stub(:find) { mock_subdomain(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:subdomain).should be(mock_subdomain)
      end

      it "re-renders the 'edit' template" do
        Subdomain.stub(:find) { mock_subdomain(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested subdomain" do
      Subdomain.should_receive(:find).with("37") { mock_subdomain }
      mock_subdomain.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the subdomains list" do
      Subdomain.stub(:find) { mock_subdomain }
      delete :destroy, :id => "1"
      response.should redirect_to(subdomains_url)
    end
  end

end
