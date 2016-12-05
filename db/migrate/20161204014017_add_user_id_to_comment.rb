class AddUserIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_name, :string
    add_column :comments, :body, :text
    add_column :comments, :user_id, :integer
  end
end
