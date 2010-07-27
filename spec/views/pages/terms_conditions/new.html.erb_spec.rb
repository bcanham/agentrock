require 'spec_helper'

describe "pages_terms_conditions/new.html.erb" do
  before(:each) do
    assign(:terms_condition, stub_model(Pages::TermsCondition,
      :new_record? => true
    ))
  end

  it "renders new terms_condition form" do
    render

    rendered.should have_selector("form", :action => pages_terms_conditions_path, :method => "post") do |form|
    end
  end
end
