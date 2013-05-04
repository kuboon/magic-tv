require 'spec_helper'

describe "programs/index" do
  before(:each) do
    assign(:programs, create_list(:program, 2))
    @current_tags = []
  end

  it "renders a list of programs" do
    render
  end
end
