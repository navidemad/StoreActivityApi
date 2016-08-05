class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.text :report
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
