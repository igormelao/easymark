require 'rails_helper'

RSpec.describe "Index Store", type: :feature do

  context "User is logged in" do

    before(:each) do
      @current_user = FactoryBot.create(:user)
      login_as(@current_user, :scope => :user, :run_callbacks => false)

      @store = FactoryBot.create(:store, user: @current_user)

      visit stores_path()
    end

    it "redirect to index store" do
      expect(current_path).to eql(stores_path())
    end

    it "display list store" do
      expect(page).to have_content("Lojas")
    end
  end

end
