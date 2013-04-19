require 'spec_helper'

describe "programs/index" do
  before(:each) do
    assign(:programs, [
      stub_model(Program,
        :uid => "Uid",
        :url => "Url",
        :name => "Name",
        :description => "Description",
        :start_at => "Start At",
        :end_at => "End At"
      ),
      stub_model(Program,
        :uid => "Uid",
        :url => "Url",
        :name => "Name",
        :description => "Description",
        :start_at => "Start At",
        :end_at => "End At"
      )
    ])
  end

  it "renders a list of programs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Start At".to_s, :count => 2
    assert_select "tr>td", :text => "End At".to_s, :count => 2
  end
end
