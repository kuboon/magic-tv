require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:twitter] = {uid: 'hogehoge', display_name: 'test'}
    end
    it "works! (now write some real specs)" do
      get "/auth/twitter"
      get user_path
      #response.status.should be(200)
    end
  end
end
