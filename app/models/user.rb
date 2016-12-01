class User < ApplicationRecord
	has_secure_password
	validates :name, presence: true
	ratyrate_rater
	has_many :comments
	has_many :ratings
end
