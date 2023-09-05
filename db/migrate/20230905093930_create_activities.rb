class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :activity_type
      t.string :title
      t.text :content
      t.datetime :date
      t.integer :duration
      t.string :address
      t.string :city
      t.integer :participants_max
      t.boolean :cancelled, default: false

      t.timestamps
    end
  end
end
