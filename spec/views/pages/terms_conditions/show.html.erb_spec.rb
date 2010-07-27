require 'spec_helper'

describe "pages_terms_conditions/show.html.erb" do
  before(:each) do
    @terms_condition = assign(:terms_condition, stub_model(Pages::TermsCondition))
  end

  it "renders attributes in <p>" do
    render
  end
end
