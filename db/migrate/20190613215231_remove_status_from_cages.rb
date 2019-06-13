class RemoveStatusFromCages < ActiveRecord::Migration[5.1]
  def change
    remove_column :cages, :status
  end
end
