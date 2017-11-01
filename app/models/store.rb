class Store < ApplicationRecord
  belongs_to :user
  has_many :sellers, inverse_of: :store, autosave: true
  accepts_nested_attributes_for :sellers, allow_destroy: true

  validates :name, :user, :sellers, presence: true
end
