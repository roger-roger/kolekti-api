require 'spec_helper'

describe "households/edit" do
  before(:each) do
    @household = assign(:household, stub_model(Household))
  end

  it "renders the edit household form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", household_path(@household), "post" do
    end
  end
end
