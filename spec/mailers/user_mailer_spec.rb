require "spec_helper"

describe UserMailer do
  describe "programs" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.programs(user) }

    it "renders the headers" do
      mail.subject.should include "[Magic TV]"
      mail.to.should eq([user.email])
      mail.from.should eq(["info@tv.magician.jp"])
    end

    it "renders the body" do
      mail.body.parts[0].body.should match("unsubscribe")
    end
  end

end
