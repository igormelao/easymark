class MarksController < ApplicationController
  before_action :set_store, except: [:show,:destroy, :update]
  before_action :set_mark, except: [:new, :create ]
  before_action :set_sellers, only: [:show]
  def new
    @mark = Mark.new
  end

  def create
    @mark = Mark.new(mark_params)
    if @mark.save
      redirect_to "/stores/#{@mark.store.id}", notice: "Meta criada com sucesso!"
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

  def update_daily_marks
    if @mark.update(daily_marks_params)
      redirect_to  "/marks/#{@mark.id}", notice:  "Metas diárias atualizadas com sucesso!"
    else
      render :show
    end
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

    def set_sellers
      @sellers = @mark.store.sellers.order(:name)
    end

    def daily_marks_params
      params.require(:mark).permit(daily_marks_attributes: [:id, :value, :new_seller_id])
    end
end
