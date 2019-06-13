class AddStatusToCages < ActiveRecord::Migration[5.1]
  def change
    add_column :cages, :status, :string
  end
end
