class CreateDailyMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_marks do |t|
      t.references :mark, foreign_key: true
      t.date :date
      t.decimal :value

      t.timestamps
    end
  end
end
