class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :content
      t.string :status
      t.references :reporter, index: true, foreign_key: { to_table: :users }
      t.references :defendant, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
