require 'spec_helper'

describe "programs/show" do
  before(:each) do
    @program = assign(:program, stub_model(Program,
      :uid => "Uid",
      :url => "Url",
      :name => "Name",
      :description => "Description",
      :start_at => "Start At",
      :end_at => "End At"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
  end
end
