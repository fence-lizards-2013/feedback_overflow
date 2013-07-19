require "spec_helper"

describe Score do

  let(:valid_score) { FactoryGirl.build :score }
  let(:invalid_score) { FactoryGirl.build :invalid_score }

  context "#save" do
    it "must not allow a user to vote twice for the same topic" do
      topic = FactoryGirl.create :topic
      user = FactoryGirl.create :user
      score = FactoryGirl.create :score, user: user, topic: topic
      expect {
        FactoryGirl.create(:score, user: user, topic: topic)
      }.to raise_error
    end

    it "must contain scores within valid Likert range for each scoreable field" do
      expect(valid_score).to be_valid
      expect(invalid_score).to be_invalid
    end
  end


end
