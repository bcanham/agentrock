require 'spec_helper'

describe "pages_terms_conditions/edit.html.erb" do
  before(:each) do
    @terms_condition = assign(:terms_condition, stub_model(Pages::TermsCondition,
      :new_record? => false
    ))
  end

  it "renders the edit terms_condition form" do
    render

    rendered.should have_selector("form", :action => terms_condition_path(@terms_condition), :method => "post") do |form|
    end
  end
end
