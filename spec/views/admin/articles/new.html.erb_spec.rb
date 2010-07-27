require 'spec_helper'

describe "admin_articles/new.html.erb" do
  before(:each) do
    assign(:article, stub_model(Admin::Article,
      :new_record? => true
    ))
  end

  it "renders new article form" do
    render

    rendered.should have_selector("form", :action => admin_articles_path, :method => "post") do |form|
    end
  end
end
