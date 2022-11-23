class AddIsAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_teacher, :boolean,  default: false
    add_column :users, :knowledge, :string
  end
end
