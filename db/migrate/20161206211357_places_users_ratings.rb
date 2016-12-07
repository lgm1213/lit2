class PlacesUsersRatings < ActiveRecord::Migration[5.0]
  def change
  	create_table :places_users_ratings, id: false do |t|
  		t.integer :places_id
  		t.integer :users_id
  		t.integer :ratings_id
  	end
	end
end
