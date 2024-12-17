class ReportsController < ApplicationController
  def index
    @products = Product.all
    @previous_stock = StocktakeEntry.where(stocktake_id: params[:previous_id]).group(:product_id).sum(:quantity)
    @current_stock = StocktakeEntry.where(stocktake_id: params[:current_id]).group(:product_id).sum(:quantity)
  end
end
