class StoresController < ApplicationController
  def index
    @stores = current_user.stores
  end
  def new
    @store = Store.new
    @store.sellers.build
  end

  def create
    @store = Store.new(store_params)

    if params[:add_new_seller]
      @store.sellers.build
      render :new
    elsif @store.save
      redirect_to stores_path()
    else
      render :new
    end
  end

  private

    def store_params
      params.require(:store).permit(:name, :sellers_attributes => [:id, :name, :store_id]).merge(user: current_user)
    end
end
