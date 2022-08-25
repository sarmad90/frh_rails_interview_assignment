class AddUniqueIndexOnProductIdAndNameToProperties < ActiveRecord::Migration[7.0]
  def change
    add_index :properties, [:product_id, :name], unique: true
  end
end
