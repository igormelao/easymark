require 'rails_helper'

RSpec.describe DailyMark do
  before(:each) do
    @daily_mark = FactoryBot.create(:daily_mark)
  end

  context "be valid" do
    it "with all params fully" do
      expect(@daily_mark).to be_valid
    end
  end

  context "not be valid" do
    it "without mark" do
      @daily_mark.mark = nil
      expect(@daily_mark).not_to be_valid
    end

    it "without date" do
      @daily_mark.date = nil
      expect(@daily_mark).not_to be_valid
    end

    it "without value" do
      @daily_mark.value = nil
      expect(@daily_mark).not_to be_valid
    end
  end
end
