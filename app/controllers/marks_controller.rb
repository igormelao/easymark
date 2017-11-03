class MarksController < ApplicationController
  before_action :set_store, except: [:show,:destroy, :update]
  before_action :set_mark, only: [:show, :edit, :update, :destroy]

  def new
    @mark = Mark.new
  end

  def create
    @mark = Mark.new(mark_params)
    if @mark.save
      redirect_to "/stores/#{@mark.store.id}", flash: { success: "Meta criada com sucesso!"}
    else
      render :new, :id_store => @store.id
    end
  end

  def edit
  end

  def update
    if @mark.update(mark_params)
      redirect_to stores_path(@mark.store), notice: "Meta atualizada com sucesso!"
    else
      render :edit, @mark.errors, :id_store => @mark.store.id
    end
  end

  def destroy
    @store = @mark.store
    @mark.destroy
    redirect_to stores_path(@store), notice: "Meta removida com sucesso!", :id_store => @store.id
  end

  def show
  end

  private

    def set_store
      @store = Store.find(params[:id_store])
    end

    def set_mark
      @mark = Mark.find(params[:id])
    end

    def mark_params
      mark_params = params.require(:mark).permit(:name, :start_date, :end_date, :month, :value).merge(store: @store)
    end
end
