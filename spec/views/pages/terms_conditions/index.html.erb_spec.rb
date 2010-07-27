require 'spec_helper'

describe "pages_terms_conditions/index.html.erb" do
  before(:each) do
    assign(:pages_terms_conditions, [
      stub_model(Pages::TermsCondition),
      stub_model(Pages::TermsCondition)
    ])
  end

  it "renders a list of pages_terms_conditions" do
    render
  end
end
