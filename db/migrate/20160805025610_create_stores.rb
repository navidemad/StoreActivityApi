class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
    add_index :stores, :name, unique: true
  end
end
