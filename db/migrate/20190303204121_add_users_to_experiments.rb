class AddUsersToExperiments < ActiveRecord::Migration[5.1]
  def change
    add_reference :experiments, :user, foreign_key: true
  end
end
