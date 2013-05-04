require 'spec_helper'

describe "programs/edit" do
  before(:each) do
    @program = assign(:program, stub_model(Program,
      :uid => "MyString",
      :url => "MyString",
      :name => "MyString",
      :description => "MyString",
      :start_at => "MyString",
      :end_at => "MyString"
    ))
  end

  it "renders the edit program form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", program_path(@program), "post" do
      #assert_select "input#program_url[name=?]", "program[url]"
    end
  end
end
