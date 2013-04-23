require 'spec_helper'

describe ImportsController do

  describe "GET 'new'" do
    subject { get 'new' }
    it "returns http success" do
      expect{subject}.to_raise CanCan::Unauthorized
    end
  end

end
