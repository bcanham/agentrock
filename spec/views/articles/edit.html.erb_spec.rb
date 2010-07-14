require 'spec_helper'

describe "articles/edit.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :new_record? => false
    ))
  end

  it "renders the edit article form" do
    render

    rendered.should have_selector("form", :action => article_path(@article), :method => "post") do |form|
    end
  end
end
