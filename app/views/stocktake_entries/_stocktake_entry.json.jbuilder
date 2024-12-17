json.extract! stocktake_entry, :id, :product_id, :stocktake_id, :quantity, :created_at, :updated_at
json.url stocktake_entry_url(stocktake_entry, format: :json)
