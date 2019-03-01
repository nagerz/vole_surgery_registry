class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :start_date
      t.string :location
      t.string :state
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0
      t.integer :activation_status, default: 0

      t.timestamps
    end
  end
end
