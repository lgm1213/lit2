class Place < ApplicationRecord
	has_many :ratings
  has_many :comment
end
