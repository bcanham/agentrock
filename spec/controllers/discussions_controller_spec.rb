require 'spec_helper'

describe DiscussionsController do

  def mock_discussion(stubs={})
    @mock_discussion ||= mock_model(Discussion, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all discussions as @discussions" do
      Discussion.stub(:all) { [mock_discussion] }
      get :index
      assigns(:discussions).should eq([mock_discussion])
    end
  end

  describe "GET show" do
    it "assigns the requested discussion as @discussion" do
      Discussion.stub(:find).with("37") { mock_discussion }
      get :show, :id => "37"
      assigns(:discussion).should be(mock_discussion)
    end
  end

  describe "GET new" do
    it "assigns a new discussion as @discussion" do
      Discussion.stub(:new) { mock_discussion }
      get :new
      assigns(:discussion).should be(mock_discussion)
    end
  end

  describe "GET edit" do
    it "assigns the requested discussion as @discussion" do
      Discussion.stub(:find).with("37") { mock_discussion }
      get :edit, :id => "37"
      assigns(:discussion).should be(mock_discussion)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created discussion as @discussion" do
        Discussion.stub(:new).with({'these' => 'params'}) { mock_discussion(:save => true) }
        post :create, :discussion => {'these' => 'params'}
        assigns(:discussion).should be(mock_discussion)
      end

      it "redirects to the created discussion" do
        Discussion.stub(:new) { mock_discussion(:save => true) }
        post :create, :discussion => {}
        response.should redirect_to(discussion_url(mock_discussion))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved discussion as @discussion" do
        Discussion.stub(:new).with({'these' => 'params'}) { mock_discussion(:save => false) }
        post :create, :discussion => {'these' => 'params'}
        assigns(:discussion).should be(mock_discussion)
      end

      it "re-renders the 'new' template" do
        Discussion.stub(:new) { mock_discussion(:save => false) }
        post :create, :discussion => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested discussion" do
        Discussion.should_receive(:find).with("37") { mock_discussion }
        mock_discussion.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :discussion => {'these' => 'params'}
      end

      it "assigns the requested discussion as @discussion" do
        Discussion.stub(:find) { mock_discussion(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:discussion).should be(mock_discussion)
      end

      it "redirects to the discussion" do
        Discussion.stub(:find) { mock_discussion(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(discussion_url(mock_discussion))
      end
    end

    describe "with invalid params" do
      it "assigns the discussion as @discussion" do
        Discussion.stub(:find) { mock_discussion(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:discussion).should be(mock_discussion)
      end

      it "re-renders the 'edit' template" do
        Discussion.stub(:find) { mock_discussion(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested discussion" do
      Discussion.should_receive(:find).with("37") { mock_discussion }
      mock_discussion.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the discussions list" do
      Discussion.stub(:find) { mock_discussion }
      delete :destroy, :id => "1"
      response.should redirect_to(discussions_url)
    end
  end

end
