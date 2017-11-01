require 'rails_helper'

RSpec.describe Store do
  before(:each) do
    @store = FactoryBot.create(:store)
  end

  context "be valid" do
    it "with all params" do
      expect(@store).to be_valid
    end
  end

  context "not be valid" do
    it "without name" do
      @store.name = nil
      expect(@store).not_to be_valid
    end

    it "without user" do
      @store.user = nil
      expect(@store).not_to be_valid
    end

    it "without at least one sellers" do
      @store.sellers = []
      expect(@store).not_to be_valid
    end
  end
end
