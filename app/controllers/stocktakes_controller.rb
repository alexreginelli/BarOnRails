class StocktakesController < ApplicationController
  before_action :set_stocktake, only: %i[ show edit update destroy ]

  # GET /stocktakes or /stocktakes.json
  def index
    @stocktakes = Stocktake.all
  end

  # GET /stocktakes/1 or /stocktakes/1.json
  def show
    @stocktake = Stocktake.find(params[:id])
    @sections = Section.includes(:products)
    @stocktake_entries = StocktakeEntry.where(stocktake_id: @stocktake.id).group_by(&:product_id)
  end

  # GET /stocktakes/new
  def new
    @stocktake = Stocktake.new
  end

  # GET /stocktakes/1/edit
  def edit
  end

  # POST /stocktakes or /stocktakes.json
  def create
    @stocktake = Stocktake.new(stocktake_params)

    respond_to do |format|
      if @stocktake.save
        format.html { redirect_to @stocktake, notice: "Stocktake was successfully created." }
        format.json { render :show, status: :created, location: @stocktake }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stocktake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocktakes/1 or /stocktakes/1.json
  def update
    respond_to do |format|
      if @stocktake.update(stocktake_params)
        format.html { redirect_to @stocktake, notice: "Stocktake was successfully updated." }
        format.json { render :show, status: :ok, location: @stocktake }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stocktake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocktakes/1 or /stocktakes/1.json
  def destroy
    @stocktake.destroy!

    respond_to do |format|
      format.html { redirect_to stocktakes_path, status: :see_other, notice: "Stocktake was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stocktake
      @stocktake = Stocktake.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stocktake_params
      params.expect(stocktake: [ :date ])
    end
end
