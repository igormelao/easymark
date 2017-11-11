class MarksController < ApplicationController
  before_action :set_store, except: [:show,:destroy, :update, :update_daily_marks]
  before_action :set_mark, except: [:new, :create, :update_daily_marks ]
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
    redirect_to "/stores/#{@store.id}", notice: "Meta removida com sucesso!", :id_store => @store.id
  end

  def show
  end

  def update_daily_marks
    daily_mark = DailyMark.find(params[:daily_mark][:id])
    seller = Seller.find_by(id: params[:daily_mark][:seller_id], store_id: daily_mark.mark.store.id)

    if seller
      if daily_mark.sellers.include? seller
        redirect_to "/marks/#{daily_mark.mark.id}", notice: "Vendedor já associado. Por favor, escolha outro vendedor!", :id_store => daily_mark.mark.store.id
      else
        daily_mark.sellers << seller
        if daily_mark.save
          redirect_to  "/marks/#{daily_mark.mark.id}", notice:  "Vendedor #{seller.name} associado a meta diária #{daily_mark.date} com sucesso!"
        else
          redirect_to "/marks/#{daily_mark.mark.id}", daily_mark.errors
        end
      end
    else
      redirect_to "/marks/#{daily_mark.mark.id}", notice: "Vendedor não cadastrado para a loja dessa meta."
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
end
