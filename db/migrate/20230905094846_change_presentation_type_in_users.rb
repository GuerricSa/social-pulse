class ChangePresentationTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :presentation, :text
  end
end
