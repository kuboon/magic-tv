require "spec_helper"

describe UserMailer do
  describe "programs" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.programs(user) }

    it "renders the headers" do
      mail.subject.should include "[Magic TV]"
      mail.to.should eq([user.email])
      mail.from.should eq(["noreply@magic-tv.trick-with.net"])
    end

    it "renders the body" do
      mail.body.encoded.should match("unsubscribe")
    end
  end

end
