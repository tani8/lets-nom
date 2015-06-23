require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :noms

  has_many :consumer_noms,
            class_name: 'UserNom',
            foreign_key: 'giver_id'

  has_many :giver_noms,
            class_name: 'UserNom',
            foreign_key: 'consumer_id'

  has_many :consumers, through: :consumer_noms
  has_many :givers, through: :giver_noms

  validates_presence_of :name, :email, :password

  validates :name, uniqueness: true

  validates :email, format: { with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/,
    message: "Oops! Invalid Email Address..." }

    def password
      @password ||= Password.new(password_hash) if password_hash
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end

end
