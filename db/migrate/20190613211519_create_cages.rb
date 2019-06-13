class CreateCages < ActiveRecord::Migration[5.1]
  def change
    create_table :cages do |t|
      t.boolean :status
      t.string :species
      t.integer :card_id
      t.string :cage_id
      t.string :type
      t.string :sex
      t.string :notes
      t.string :status
      t.date :pair_date

      t.timestamps
    end
  end
end
