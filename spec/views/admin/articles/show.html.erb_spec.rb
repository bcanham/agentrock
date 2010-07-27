require 'spec_helper'

describe "admin_articles/show.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Admin::Article))
  end

  it "renders attributes in <p>" do
    render
  end
end
