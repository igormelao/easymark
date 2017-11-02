class AddNameStringToMark < ActiveRecord::Migration[5.0]
  def change
    add_column :marks, :name, :string
  end
end
