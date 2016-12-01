class AddNewColumnToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :city, :string
    add_column :places, :state_code, :string
    add_column :places, :postal_code, :string
    add_column :places, :neighborhoods, :string
    add_column :places, :coordinate_latitude, :string
    add_column :places, :coordinate_longitude, :string
  end
end
