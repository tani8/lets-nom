class UserNoms < ActiveRecord::Migration
  def change
    create_table :user_noms do |t|
      t.integer :giver_id
      t.integer :consumer_id

      t.timestamps
    end
  end
end
