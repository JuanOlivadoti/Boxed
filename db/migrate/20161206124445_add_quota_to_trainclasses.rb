class AddQuotaToTrainclasses < ActiveRecord::Migration[5.0]
  def change
    add_column :trainclasses, :quota, :integer
  end
end
