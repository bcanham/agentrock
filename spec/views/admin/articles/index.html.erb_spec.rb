require 'spec_helper'

describe "admin_articles/index.html.erb" do
  before(:each) do
    assign(:admin_articles, [
      stub_model(Admin::Article),
      stub_model(Admin::Article)
    ])
  end

  it "renders a list of admin_articles" do
    render
  end
end
