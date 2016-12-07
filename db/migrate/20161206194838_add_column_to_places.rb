class AddColumnToPlaces < ActiveRecord::Migration[5.0]
  def change
  	add_column :places, :rating_id, :integer
  end
end
