class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
