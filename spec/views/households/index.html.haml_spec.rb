require 'spec_helper'

describe "households/index" do
  before(:each) do
    assign(:households, [
      stub_model(Household),
      stub_model(Household)
    ])
  end

  it "renders a list of households" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
