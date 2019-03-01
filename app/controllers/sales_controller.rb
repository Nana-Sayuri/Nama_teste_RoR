class SalesController < ApplicationController
  before_action :set_sale, only: %i[show edit update destroy]

  def index
    @sales = Sale.all  	
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def edit
  end

  def create
    if params[:sale]
      file = params[:sale][:process_file] if params[:sale][:process_file]
      if file && file.content_type == 'text/plain'
        process_file_result = Sale.process_file(file.read)
        if process_file_result[:status]
          redirect_to sales_url, notice: "O total de venda foi de #{process_file_result[:total]}"
        else
          render "index"
        end
      end
    else
      render "index"
    end
  end
  
  def destroy
    @sale.destroy
    redirect_to sales_url
  end

  private
  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:process_file, :buyer, :description, :unity_price, :quantity, :address, :supplier)
  end
end
