class StoresController < ApplicationController
  def index
    @stores = current_user.stores
  end
end
