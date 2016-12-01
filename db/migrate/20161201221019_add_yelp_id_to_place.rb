class AddYelpIdToPlace < ActiveRecord::Migration[5.0]
  def change
      add_column :places, :yelp_id, :string
  end
end
