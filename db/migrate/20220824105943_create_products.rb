class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :upc
      t.datetime :available_on

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :upc, unique: true
  end
end
