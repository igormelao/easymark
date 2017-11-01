require 'rails_helper'

RSpec.describe Seller do
  before(:each) do
    @store = FactoryBot.create(:store)
    @seller = Seller.create(name: FFaker::Name.name, store: @store)
  end

  context "be valid" do
    it "with all params" do
      expect(@seller).to be_valid
    end
  end

  context "not be valid" do
    it "without name" do
      @seller.name = nil
      expect(@seller).not_to be_valid
    end

    it "without store" do
      @seller.store = nil
      expect(@seller).not_to be_valid
    end

  end
end
