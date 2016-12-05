class AddGooglePlacesIdToPlaces < ActiveRecord::Migration[5.0]
  def change
  	add_column :places, :google_places_id, :string
  end
end
