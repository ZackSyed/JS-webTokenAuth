class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, unique: true 
      t.string :email, allow_nil: true, unique: true
      t.string :password_digest
      t.string :session_token 

      t.timestamps
    end
    add_index :users, :name 
    add_index :users, :email 
  end
end
