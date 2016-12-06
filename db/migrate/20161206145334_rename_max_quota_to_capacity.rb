class RenameMaxQuotaToCapacity < ActiveRecord::Migration[5.0]
  def change
  	rename_column :trainclasses, :max_quota, :capacity
  end
end
