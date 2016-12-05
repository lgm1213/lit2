# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
module YelpTools
	def self.client
		@@client ||= Yelp::Client.new({
			consumer_key: ENV["CONSUMER_KEY"],
			consumer_secret: ENV["CONSUMER_SECRET"],
			token: ENV["TOKEN"],
			token_secret: ENV["TOKEN_SECRET"]
			})
	end

	def self.search(zip,options)
		client.search(zip, options)
	end
end

def get_neighborhood(biz)
	begin
		return biz.location.neighborhoods.flatten.join
	rescue NoMethodError => error
		return error.to_s
	end
end



def index

	zip_array = ['33127','33139','78701','11211','10014','10009', '60654','90014', '20009', '89109', '11201']

	@image_urls=[]

	zip_array.each do |zip|
		  profile=YelpTools.search(zip, {term: "Nightlife", limit: 40})
		  profile.businesses.each do |biz|
		  	attr = {name: biz.name, address: biz.location.address.flatten.join, phone: biz.phone, city: biz.location.city, state_code: biz.location.state_code, postal_code: biz.location.postal_code, neighborhoods: get_neighborhood(biz), coordinate_latitude: biz.location.coordinate.latitude, coordinate_longitude: biz.location.coordinate.longitude, yelp_id: biz.id}
		  	attr.merge!(image_url: biz.image_url[0..-8]+'/ls.jpg') if biz.image_url
		    found_place=Place.find_or_create_by(attr)
		    p "Created #{biz.location.city}"

		    @image_urls << biz.image_url
		    found_place.save
		  end
		end


	def yelp_parameters(terms,limits)
		{ term: terms, limit: limits}
	end
end

	index