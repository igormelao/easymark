class DailyMark < ApplicationRecord
  belongs_to :mark
  has_and_belongs_to_many :sellers,
                          inverse_of: :store,
                          autosave: true,
                          dependent: :destroy

  attr_accessor :new_seller_id

  accepts_nested_attributes_for :sellers,
                                reject_if: proc { |attributes| attributes[:name].blank? },
                                allow_destroy: true

  validates :date, :value, presence: true
end
