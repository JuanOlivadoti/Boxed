class CreateTrainclasses < ActiveRecord::Migration[5.0]
  def change
    create_table :trainclasses do |t|
      t.date :date
      t.time :datetime
      t.integer :max_quota
      t.integer :train_class_type
      t.integer :coach_id

      t.timestamps
    end
  end
end
