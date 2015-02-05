class CreateClientsListings < ActiveRecord::Migration
  def change
    create_table :clients_listings do |t|
    	t.references :listing
		t.references :client
    end
  end
  def self.down
  drop_table :clients_listings
  end
end
