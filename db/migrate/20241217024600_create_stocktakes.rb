class CreateStocktakes < ActiveRecord::Migration[8.0]
  def change
    create_table :stocktakes do |t|
      t.date :date

      t.timestamps
    end
  end
end