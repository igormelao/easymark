class MarksController < ApplicationController
  before_action :set_store
  before_action :set_mark, only: [:show]
  def new
    @mark = Mark.new
  end

  def create
    @mark = Mark.new(mark_params)
    @mark.month = mark_params[:month] << "-01"
    @mark.store = @store

    if @mark.save
      redirect_to marks_path(@mark), flash: { success: "Meta criada com sucesso!"}
    else
      render :new
    end
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
      mark_params = params.require(:mark).permit(:name, :start_date, :end_date, :month, :value)
    end
end
