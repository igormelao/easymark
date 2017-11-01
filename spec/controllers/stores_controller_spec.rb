require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe "GET #index" do


    context "user logged in" do

      before(:each)do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        @current_user = FactoryBot.create(:user)
        sign_in @current_user
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

    end

    context "user is not logged in" do

      it "redirect to login path" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

    end

  end

end
