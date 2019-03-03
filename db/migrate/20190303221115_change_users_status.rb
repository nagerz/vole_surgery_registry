class ChangeUsersStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :status, :active
  end
end
