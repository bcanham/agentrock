require 'spec_helper'

describe "articles/new.html.erb" do
  before(:each) do
    assign(:article, stub_model(Article,
      :new_record? => true
    ))
  end

  it "renders new article form" do
    render

    rendered.should have_selector("form", :action => articles_path, :method => "post") do |form|
    end
  end
end
