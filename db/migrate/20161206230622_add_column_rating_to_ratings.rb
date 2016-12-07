class AddColumnRatingToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :rating, :integer
  end
end
