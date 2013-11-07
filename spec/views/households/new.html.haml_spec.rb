require 'spec_helper'

describe "households/new" do
  before(:each) do
    assign(:household, stub_model(Household).as_new_record)
  end

  it "renders new household form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", households_path, "post" do
    end
  end
end
