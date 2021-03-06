class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.boolean :isEditor, default: false
      t.string :password_digest, null: false
      t.string :session_token
      t.attachment :avatar

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email, unique: true

  end
end
