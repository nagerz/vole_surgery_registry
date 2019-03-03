class UpdateUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :activation_status
    add_column :users, :status, :boolean, default: true
    add_index :users, :location
    add_index :users, :state
    add_index :users, :email
  end
end
