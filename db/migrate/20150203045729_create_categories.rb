class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categoryname
      t.decimal :position
      t.timestamps null: false
    end
  end
end
