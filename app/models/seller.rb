class Seller < ApplicationRecord
  belongs_to :store
  validates :name, :store, presence: true
end
