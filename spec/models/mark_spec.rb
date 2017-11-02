require 'rails_helper'

RSpec.describe Mark do
  before(:each) do
    @mark = FactoryBot.create(:mark)
  end

  context "be valid" do
    it "with all params fully" do
      expect(@mark).to be_valid
    end
  end

  context "not be valid" do
    it "without name" do
      @mark.name = nil
      expect(@mark).not_to be_valid
    end

    it "without store" do
      @mark.store = nil
      expect(@mark).not_to be_valid
    end

    it "without start_date" do
      @mark.start_date = nil
      expect(@mark).not_to be_valid
    end

    it "without end_date" do
      @mark.end_date = nil
      expect(@mark).not_to be_valid
    end

    it "without month" do
      @mark.month = nil
      expect(@mark).not_to be_valid
    end

    it "without value" do
      @mark.value = nil
      expect(@mark).not_to be_valid
    end

    it "when start_date is not inside month" do
      @mark.start_date = @mark.month + 32
      expect(@mark).not_to be_valid
    end

    it "when end_date is not inside month" do
      @mark.end_date = @mark.month + 32
      expect(@mark).not_to be_valid
    end

    it "when start_date is greater than end_date" do
      @mark.end_date = @mark.end_date - 7 #if don't decrease end_date it will be invalidate on period not valid
      @mark.start_date = @mark.end_date + 1
      expect(@mark).not_to be_valid
    end

    it "when end_date is smaller than start_date" do
      @mark.start_date = @mark.start_date + 5 #if don't increase start_date it will be invalidate on period not valid
      @mark.end_date = @mark.start_date - 5
      expect(@mark).not_to be_valid
    end

    it "when period conflicting with another mark period" do
      new_mark = FactoryBot.build(:mark, store: @mark.store)
      expect(new_mark).not_to be_valid
    end
  end

end
