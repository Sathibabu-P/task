class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :listingname
      t.references :area
      t.references :category
      t.decimal :price
      t.text :contactinfo
      t.timestamps null: false
    end
  end
  def self.down
  	drop_table :listings
  end
end
