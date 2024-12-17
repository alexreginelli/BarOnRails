class Product < ApplicationRecord
  belongs_to :section
  has_many :stocktake_entries, dependent: :destroy
  validates :name, :unit, presence: true
end
