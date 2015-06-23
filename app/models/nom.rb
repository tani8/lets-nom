class Nom < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :food_name, :amount_type, :amount, :date_made, :allergens, :address
end
