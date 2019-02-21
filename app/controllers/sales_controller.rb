class SalesController < ApplicationController

  def new
    @sale = Sale.new(sale_params)
  end
  	
  def show
  end

  private
  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:buyer, :description, :unity_price, :quantity, :address, :supplier)
  end
end
