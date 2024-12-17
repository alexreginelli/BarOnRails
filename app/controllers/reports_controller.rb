class ReportsController < ApplicationController
  def index
    @stocktakes = Stocktake.all
    @products = Product.all
  
    @previous_stock = {}
    @current_stock = {}
  
    if params[:stocktake_a_id] && params[:stocktake_b_id]
      stocktake_a = Stocktake.find_by(id: params[:stocktake_a_id])
      stocktake_b = Stocktake.find_by(id: params[:stocktake_b_id])
  
      if stocktake_a && stocktake_b
        @previous_stock = stocktake_a.stocktake_entries.group(:product_id).sum(:quantity)
        @current_stock = stocktake_b.stocktake_entries.group(:product_id).sum(:quantity)
      else
        flash[:alert] = "Stock take not found"
      end
    end
  end
end
