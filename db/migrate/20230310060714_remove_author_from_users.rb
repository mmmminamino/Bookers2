class RemoveAuthorFromUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :users, :user_id, :integer
  end
  
  def down
    add_column :users, :user_id, :integer
  end
end
