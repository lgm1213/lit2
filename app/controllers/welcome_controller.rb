class WelcomeController < ApplicationController
		include YelpTools
	def index
    # YelpTools.client
    profile=YelpTools.search('33127', yelp_parameters("Nightlife", 40))
    @image_urls=[]
    profile.businesses.each do |biz|
      found_place=Place.find_or_create_by(name: biz.name, address: biz.location.address.flatten.join, phone: biz.phone, city: biz.location.city, state_code: biz.location.state_code, postal_code: biz.location.postal_code, neighborhoods: get_neighborhood(biz), coordinate_latitude: biz.location.coordinate.latitude, coordinate_longitude: biz.location.coordinate.longitude, yelp_id: biz.id)
    # found_place.image_url=biz.image_url
    @image_urls << biz.image_url
    end
    @places = Place.all
    unless session[:user_id]
    	@places=Place.first 3
    	@image_urls=@image_urls.slice 0,3
    end
  end
  private
  def yelp_parameters(terms,limits)
      { term: terms, limit: limits}
    end

    def get_neighborhood(biz)
    	begin
    		return biz.location.neighborhoods.flatten.join
    	rescue NoMethodError => error
    		return error.to_s
    	end
    end
end