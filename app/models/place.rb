class Place < ApplicationRecord
	include Geocoder
	ratyrate_rateable 'atmosphere', 'drinks', 'wait_time', 'cost', 'music'
	has_many :ratings
  has_many :comment
  validates :yelp_id, uniqueness: true
  reverse_geocoded_by :latitude => :coordinate_latitude, :longitude => :coordinate_longitude, :address => :geo_address
	after_validation :reverse_geocode  # auto-fetch address
end
