class CreateStocktakeEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :stocktake_entries do |t|
      t.references :product, null: false, foreign_key: true
      t.references :stocktake, null: false, foreign_key: true
      t.decimal :quantity

      t.timestamps
    end
  end
end
