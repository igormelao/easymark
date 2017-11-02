class CreateMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :marks do |t|
      t.references :store, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.date :month
      t.decimal :value

      t.timestamps
    end
  end
end
