class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    #drop_table :users
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :role, null: false 
      t.string :first_name
      t.string :last_name
      t.string :location
      t.text   :image_url
      t.string :url
      t.boolean :agreed

      #t.timestamps null: false
    end
    add_index :users, :provider
    add_index :users, :uid
    add_index :users, [:provider, :uid], unique: true
  end
end
