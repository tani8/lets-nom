class Noms < ActiveRecord::Migration
  def change
    create_table :noms do |t|
      t.string :food_name, :allergens, :address, :image_url, :amount_type 
      t.integer :amount
      t.date :date_made
      t.string :lon
      t.string :lat
      t.belongs_to :user

      t.timestamps
    end
  end
end
