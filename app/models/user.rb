class User < ApplicationRecord
	has_secure_password
	validates :name, presence: true
	has_many :comments
	has_many :ratings
	validates :name, presence: true

  
end
