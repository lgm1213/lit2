class RemoveColumnsFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :names
  end
end
