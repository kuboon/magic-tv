require 'spec_helper'

describe ImportsController do

  describe "GET 'new'" do
    subject { get 'new' }
    it "returns http success" do
      expect{subject}.to raise_error CanCan::Unauthorized
    end
  end

end
