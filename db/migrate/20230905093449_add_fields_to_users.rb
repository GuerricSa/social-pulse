class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :age, :integer
    add_column :users, :presentation, :string
    add_column :users, :admin, :boolean, default: false
  end
end
