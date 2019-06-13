class CreateVoles < ActiveRecord::Migration[5.1]
  def change
    create_table :voles do |t|
      t.string :animal_id
      t.string :sex
      t.date :dob
      t.date :P60
      t.string :markings
      t.string :free_use
      t.string :status
      t.string :notes
      t.references :cage, foreign_key: true

      t.timestamps
    end
  end
end
