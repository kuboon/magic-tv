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
      assert_select "input#program_uid[name=?]", "program[uid]"
      assert_select "input#program_url[name=?]", "program[url]"
      assert_select "input#program_name[name=?]", "program[name]"
      assert_select "input#program_description[name=?]", "program[description]"
      assert_select "input#program_start_at[name=?]", "program[start_at]"
      assert_select "input#program_end_at[name=?]", "program[end_at]"
    end
  end
end
