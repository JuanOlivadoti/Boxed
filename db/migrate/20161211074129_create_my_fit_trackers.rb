class CreateMyFitTrackers < ActiveRecord::Migration[5.0]
  def change
    create_table :my_fit_trackers do |t|
      t.string :exercise
      t.integer :value
      t.string :um
      t.integer :exercise_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
