class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

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
      redirect_to stores_path, notice: "Loja criada com sucesso!"
    else
      render :new, notice: @store.errors
    end
  end

  def edit
  end

  def update
    if params[:add_new_seller]
      @store.sellers.build
      render :new
    elsif
      if @store.update(store_params)
        redirect_to @store, notice: "Loja atualizada com sucesso!"
      else
        render :edit, @sotore.errors
      end
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice: "Loja removida com sucesso!"
  end

  private

    def store_params
      params.require(:store).permit(:name, :sellers_attributes => [:id, :name, :store_id, :_destroy]).merge(user: current_user)
    end

    def set_store
      @store = Store.find(params[:id])
    end
end
