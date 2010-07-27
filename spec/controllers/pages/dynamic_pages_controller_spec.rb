require 'spec_helper'

describe Pages::DynamicPagesController do

  def mock_dynamic_page(stubs={})
    @mock_dynamic_page ||= mock_model(Pages::DynamicPage, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all pages_dynamic_pages as @pages_dynamic_pages" do
      Pages::DynamicPage.stub(:all) { [mock_dynamic_page] }
      get :index
      assigns(:pages_dynamic_pages).should eq([mock_dynamic_page])
    end
  end

  describe "GET show" do
    it "assigns the requested dynamic_page as @dynamic_page" do
      Pages::DynamicPage.stub(:find).with("37") { mock_dynamic_page }
      get :show, :id => "37"
      assigns(:dynamic_page).should be(mock_dynamic_page)
    end
  end

  describe "GET new" do
    it "assigns a new dynamic_page as @dynamic_page" do
      Pages::DynamicPage.stub(:new) { mock_dynamic_page }
      get :new
      assigns(:dynamic_page).should be(mock_dynamic_page)
    end
  end

  describe "GET edit" do
    it "assigns the requested dynamic_page as @dynamic_page" do
      Pages::DynamicPage.stub(:find).with("37") { mock_dynamic_page }
      get :edit, :id => "37"
      assigns(:dynamic_page).should be(mock_dynamic_page)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created dynamic_page as @dynamic_page" do
        Pages::DynamicPage.stub(:new).with({'these' => 'params'}) { mock_dynamic_page(:save => true) }
        post :create, :dynamic_page => {'these' => 'params'}
        assigns(:dynamic_page).should be(mock_dynamic_page)
      end

      it "redirects to the created dynamic_page" do
        Pages::DynamicPage.stub(:new) { mock_dynamic_page(:save => true) }
        post :create, :dynamic_page => {}
        response.should redirect_to(pages_dynamic_page_url(mock_dynamic_page))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dynamic_page as @dynamic_page" do
        Pages::DynamicPage.stub(:new).with({'these' => 'params'}) { mock_dynamic_page(:save => false) }
        post :create, :dynamic_page => {'these' => 'params'}
        assigns(:dynamic_page).should be(mock_dynamic_page)
      end

      it "re-renders the 'new' template" do
        Pages::DynamicPage.stub(:new) { mock_dynamic_page(:save => false) }
        post :create, :dynamic_page => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested dynamic_page" do
        Pages::DynamicPage.should_receive(:find).with("37") { mock_dynamic_page }
        mock_pages_dynamic_page.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dynamic_page => {'these' => 'params'}
      end

      it "assigns the requested dynamic_page as @dynamic_page" do
        Pages::DynamicPage.stub(:find) { mock_dynamic_page(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:dynamic_page).should be(mock_dynamic_page)
      end

      it "redirects to the dynamic_page" do
        Pages::DynamicPage.stub(:find) { mock_dynamic_page(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pages_dynamic_page_url(mock_dynamic_page))
      end
    end

    describe "with invalid params" do
      it "assigns the dynamic_page as @dynamic_page" do
        Pages::DynamicPage.stub(:find) { mock_dynamic_page(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:dynamic_page).should be(mock_dynamic_page)
      end

      it "re-renders the 'edit' template" do
        Pages::DynamicPage.stub(:find) { mock_dynamic_page(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested dynamic_page" do
      Pages::DynamicPage.should_receive(:find).with("37") { mock_dynamic_page }
      mock_pages_dynamic_page.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pages_dynamic_pages list" do
      Pages::DynamicPage.stub(:find) { mock_dynamic_page }
      delete :destroy, :id => "1"
      response.should redirect_to(pages_dynamic_pages_url)
    end
  end

end
