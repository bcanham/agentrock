require 'spec_helper'

describe Users::OmniauthCallbacksController do

  describe "GET 'facebook'" do
    it "should be successful" do
      get 'facebook'
      response.should be_success
    end
  end

  describe "GET 'twitter'" do
    it "should be successful" do
      get 'twitter'
      response.should be_success
    end
  end

  describe "GET 'soundcloud'" do
    it "should be successful" do
      get 'soundcloud'
      response.should be_success
    end
  end

end
