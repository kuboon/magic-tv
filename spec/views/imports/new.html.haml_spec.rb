require 'spec_helper'

describe "imports/new.html.haml" do
  before do
    @programs = create_list(:program, 3, status: :draft, start_at: 1.day.since)
  end
  it "renders program" do
    render
    assert_select "a", @programs[0].name
  end
end
