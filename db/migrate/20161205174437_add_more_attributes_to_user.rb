class AddMoreAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :dni, :string
    add_column :users, :bday, :date
    add_column :users, :medcert, :date
    add_column :users, :user_type, :integer
  end
end
