class StocktakeEntriesController < ApplicationController
  before_action :set_stocktake_entry, only: %i[ show edit update destroy ]

  # GET /stocktake_entries or /stocktake_entries.json
  def index
    @stocktake_entries = StocktakeEntry.all
  end

  # GET /stocktake_entries/1 or /stocktake_entries/1.json
  def show
  end

  # GET /stocktake_entries/new
  def new
    @stocktake_entry = StocktakeEntry.new
  end

  # GET /stocktake_entries/1/edit
  def edit
  end

  # POST /stocktake_entries or /stocktake_entries.json
  def create
    def create
      stocktake_id = params[:stocktake_id]
  
      # Loop through submitted product quantities and save them
      params[:stocktake].each do |product_id, quantity|
        next if quantity.blank? # Skip if no quantity is entered
  
        StocktakeEntry.create!(
          stocktake_id: stocktake_id,
          product_id: product_id,
          quantity: quantity
        )
      end
  
      # Redirect to the stocktake show page
      redirect_to stocktake_path(stocktake_id), notice: "Stocktake saved successfully!"
    end
  end

  # PATCH/PUT /stocktake_entries/1 or /stocktake_entries/1.json
  def update
    respond_to do |format|
      if @stocktake_entry.update(stocktake_entry_params)
        format.html { redirect_to @stocktake_entry, notice: "Stocktake entry was successfully updated." }
        format.json { render :show, status: :ok, location: @stocktake_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stocktake_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocktake_entries/1 or /stocktake_entries/1.json
  def destroy
    @stocktake_entry.destroy!

    respond_to do |format|
      format.html { redirect_to stocktake_entries_path, status: :see_other, notice: "Stocktake entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stocktake_entry
      @stocktake_entry = StocktakeEntry.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stocktake_entry_params
      params.expect(stocktake_entry: [ :product_id, :stocktake_id, :quantity ])
    end
end
