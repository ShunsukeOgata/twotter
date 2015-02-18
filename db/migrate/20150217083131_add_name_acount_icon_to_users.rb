class AddNameAcountIconToUsers < ActiveRecord::Migration
  def change

    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :account, :string, null: false, default: ""
    add_column :users, :icon, :string, null: false, default: ""
  end
end
