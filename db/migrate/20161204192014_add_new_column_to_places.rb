class AddNewColumnToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :column_name, :google_place_id
  end
end
