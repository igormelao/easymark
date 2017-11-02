class Store < ApplicationRecord
  belongs_to :user
  has_many :sellers, inverse_of: :store, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :sellers,
        reject_if: proc { |attributes| attributes[:name].blank? },
        allow_destroy: true

  validates :name, :user, :sellers, presence: true
end
