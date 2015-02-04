class CreateAreas < ActiveRecord::Migration
  def up
    create_table :areas do |t|
      t.string :areaname
      t.decimal :position
      t.timestamps null: false
    end
  end
  def down
  	drop_table :areas
  end
end
