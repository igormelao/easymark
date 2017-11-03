require 'rails_helper'

RSpec.describe MarksController do
  include Devise::Test::ControllerHelpers

  describe "POST #create" do

    before(:each)do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      @current_user = FactoryBot.create(:user)

      sign_in @current_user

      @store = FactoryBot.create(:store, user: @current_user)
    end

    context "create store successfully" do
      before(:each) do
        @mark_attributes = FactoryBot.attributes_for(:mark, store: @store)
        post :create, params: { mark: @mark_attributes, id_store: @store.id }
      end

      it "redirects to show store" do
        expect(response).to have_http_status(302)
        expect(response).to redirect_to store_path(@store)
      end

      it "with rights attributes" do
        expect(Mark.last.name).to eql(@mark_attributes[:name])
        expect(Mark.last.month).to eql(@mark_attributes[:month])
        expect(Mark.last.start_date).to eql(@mark_attributes[:start_date])
        expect(Mark.last.end_date).to eql(@mark_attributes[:end_date])
        expect(Mark.last.value).to eql(@mark_attributes[:value])
        expect(Mark.last.store.id).to eql(@store.id)
      end

    end

    context "create mark with errors" do
      it "redirect to show store with errors" do
        @mark_attributes = FactoryBot.attributes_for(:mark, store: nil)
        post :create, params: { mark: @mark_attributes, id_store: @store.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end
