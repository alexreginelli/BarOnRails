class StocktakeEntry < ApplicationRecord
  belongs_to :product
  belongs_to :stocktake
end
