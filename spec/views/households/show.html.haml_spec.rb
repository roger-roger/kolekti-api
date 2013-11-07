require 'spec_helper'

describe "households/show" do
  before(:each) do
    @household = assign(:household, stub_model(Household))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
