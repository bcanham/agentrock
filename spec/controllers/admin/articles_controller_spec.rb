require 'spec_helper'

describe Admin::ArticlesController do

  def mock_article(stubs={})
    @mock_article ||= mock_model(Admin::Article, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all admin_articles as @admin_articles" do
      Admin::Article.stub(:all) { [mock_article] }
      get :index
      assigns(:admin_articles).should eq([mock_article])
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      Admin::Article.stub(:find).with("37") { mock_article }
      get :show, :id => "37"
      assigns(:article).should be(mock_article)
    end
  end

  describe "GET new" do
    it "assigns a new article as @article" do
      Admin::Article.stub(:new) { mock_article }
      get :new
      assigns(:article).should be(mock_article)
    end
  end

  describe "GET edit" do
    it "assigns the requested article as @article" do
      Admin::Article.stub(:find).with("37") { mock_article }
      get :edit, :id => "37"
      assigns(:article).should be(mock_article)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created article as @article" do
        Admin::Article.stub(:new).with({'these' => 'params'}) { mock_article(:save => true) }
        post :create, :article => {'these' => 'params'}
        assigns(:article).should be(mock_article)
      end

      it "redirects to the created article" do
        Admin::Article.stub(:new) { mock_article(:save => true) }
        post :create, :article => {}
        response.should redirect_to(admin_article_url(mock_article))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        Admin::Article.stub(:new).with({'these' => 'params'}) { mock_article(:save => false) }
        post :create, :article => {'these' => 'params'}
        assigns(:article).should be(mock_article)
      end

      it "re-renders the 'new' template" do
        Admin::Article.stub(:new) { mock_article(:save => false) }
        post :create, :article => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested article" do
        Admin::Article.should_receive(:find).with("37") { mock_article }
        mock_admin_article.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :article => {'these' => 'params'}
      end

      it "assigns the requested article as @article" do
        Admin::Article.stub(:find) { mock_article(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:article).should be(mock_article)
      end

      it "redirects to the article" do
        Admin::Article.stub(:find) { mock_article(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_article_url(mock_article))
      end
    end

    describe "with invalid params" do
      it "assigns the article as @article" do
        Admin::Article.stub(:find) { mock_article(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:article).should be(mock_article)
      end

      it "re-renders the 'edit' template" do
        Admin::Article.stub(:find) { mock_article(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested article" do
      Admin::Article.should_receive(:find).with("37") { mock_article }
      mock_admin_article.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admin_articles list" do
      Admin::Article.stub(:find) { mock_article }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_articles_url)
    end
  end

end
