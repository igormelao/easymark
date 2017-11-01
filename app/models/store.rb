class Store < ApplicationRecord
  belongs_to :user
  has_many :sellers

  accepts_nested_attributes_for :sellers

  validates :name, :user, :sellers, presence: true
end
