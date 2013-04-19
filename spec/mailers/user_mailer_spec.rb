require "spec_helper"

describe UserMailer do
  describe "programs" do
    let(:mail) { UserMailer.programs }

    it "renders the headers" do
      mail.subject.should eq("Programs")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
