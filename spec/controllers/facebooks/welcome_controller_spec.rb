require 'spec_helper'

describe Facebooks::WelcomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end
