class Place < ApplicationRecord
	ratyrate_rateable 'atmosphere', 'drinks', 'wait_time', 'cost', 'music'
	has_many :ratings
  has_many :comment
  validates :yelp_id, uniqueness: true
end
