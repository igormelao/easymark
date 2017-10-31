require 'rails_helper'

RSpec.feature "Home" do
  context "with logged user" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user, :run_callbacks => false)

      visit root_path
    end

    it "redirects to root" do
        expect(current_path).to eql(root_path)
    end

    it "have content message for create store" do
      expect(page).to have_content("Tenha controle sobre suas metas!")
    end
  end

  context "with unlogged user" do
    before(:each) do
      visit root_path
    end

    it "redirects to login page" do
      expect(current_path).to eql(user_session_path)
    end
  end
end
