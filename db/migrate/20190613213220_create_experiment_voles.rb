class CreateExperimentVoles < ActiveRecord::Migration[5.1]
  def change
    create_table :experiment_voles do |t|
      t.references :experiment, foreign_key: true
      t.references :vole, foreign_key: true
      t.string :surgery_type
      t.string :pain_category

      t.timestamps
    end
  end
end
