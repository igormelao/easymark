require 'rails_helper'

RSpec.describe "New Store", type: :feature do

  context "User is logged in" do

    before(:each) do
      @current_user = FactoryBot.create(:user)
      login_as(@current_user, :scope => :user, :run_callbacks => false)

      visit stores_path()
      find('#adicionar-store').click

      fill_in 'store[name]', with: "Chilli"
      fill_in 'store[sellers_attributes][0][name]', with: "Ana"
      find('#cadastrar').click

    end

    it "display list store" do
      expect(page).to have_content("Lojas")
    end
  end

end
