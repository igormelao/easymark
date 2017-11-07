require 'rails_helper'

RSpec.describe StoresController do
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

  describe "POST #create" do

    before(:each)do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @current_user = FactoryBot.create(:user)
      sign_in @current_user
    end

    context "create store successfully" do
      before(:each) do
        @store_attributes = FactoryBot.attributes_for(:store, user: @current_user)
        post :create, params: { store: { name: @store_attributes[:name], sellers_attributes: { "0" => { "name" => @store_attributes[:sellers_attributes][0][:name] } } } }
      end

      it "redirects to index store" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to stores_path()
      end

      it "with rights attributes" do
        expect(Store.last.name).to eql(@store_attributes[:name])
        expect(Store.last.user_id).to eql(@current_user.id)
      end

      it "with at least one seller created" do
        expect(Store.last.sellers.count).to eq(1)
        expect(Store.last.sellers[0].name).to eq(@store_attributes[:sellers_attributes][0][:name])
      end

    end

    context "create store with errors" do
      it "redirect to index store with errors" do
        @store_attributes = FactoryBot.attributes_for(:store, name: nil)
        post :create, params: { store: @store_attributes }
        expect(response).to have_http_status(:success)
      end
    end
  end

end
