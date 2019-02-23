class SalesController < ApplicationController

  def new
    @sale = Sale.new(sale_params)
  end
    
  def create #similar guideRoR?
    @info = Info.find(params[:info_id])
    @sale = @info.sales.create(sale_params)
    redirect_to sale_path(@info)
  end

  private
  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:buyer, :description, :unity_price, :quantity, :address, :supplier)
  end
end