class AddColumnToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :user_id, :integer
    add_column :ratings, :place_id, :integer
  end
end
