class Stocktake < ApplicationRecord
    has_many :stocktake_entries, dependent: :destroy
end
