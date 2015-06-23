class UserNom < ActiveRecord::Base
  belongs_to :giver, class_name: "User"
  belongs_to :consumer, class_name: "User"

  # validates giver.id != consumer.id
end
