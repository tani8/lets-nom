class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :password_hash
    end
  end
end
