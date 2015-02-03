class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.string :fname, :limit => 50, null: false
      t.string :lname, :limit => 50, null: true
      t.string :email, null: false
      t.string :password
      t.decimal :phoneno
      t.date :dob
      t.string :gender      
      t.text :likes
      t.text :address
      t.references :user
      t.timestamps null: false     
    end
  end
  def down
  	drop_table :profiles
  end
end
