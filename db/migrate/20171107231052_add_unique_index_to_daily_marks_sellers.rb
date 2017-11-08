class AddUniqueIndexToDailyMarksSellers < ActiveRecord::Migration[5.0]
  def change
    add_index :daily_marks_sellers, [:daily_mark_id, :seller_id], unique: true
  end
end
