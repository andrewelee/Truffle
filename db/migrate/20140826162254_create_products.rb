class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.float :price, null: false
      t.integer :brand_id
      t.integer :category_id
      t.integer :finder_user_id, null: false
      t.integer :editor_user_id, null: false
      t.attachment :image

      t.timestamps
    end

    add_index :products, :name, unique: true
    add_index :products, :price
    add_index :products, :category_id
    add_index :products, :brand_id
    add_index :products, :finder_user_id
    add_index :products, :editor_user_id
  end
end
