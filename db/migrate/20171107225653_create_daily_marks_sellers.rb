class CreateDailyMarksSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_marks_sellers do |t|
      t.references :daily_mark, null: false, index: true, foreign_key: true
      t.references :seller, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
