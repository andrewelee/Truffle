class CreateCollectionItems < ActiveRecord::Migration
  def change
    create_table :collection_items do |t|
      t.integer :collection_id
      t.integer :product_id

      t.timestamps
    end

    add_index :collection_items, :product_id
    add_index :collection_items, :collection_id
    add_index :collection_items, [:collection_id, :product_id], unique: true
  end
end
