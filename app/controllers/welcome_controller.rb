class WelcomeController < ApplicationController
	def index
		client = Yelp::Client.new({
			consumer_key: ENV["CONSUMER_KEY"],
			consumer_secret: ENV["CONSUMER_SECRET"],
  		token: ENV["TOKEN"],
  		token_secret: ENV["TOKEN_SECRET"]
		})
  	parameters = { term: "Nightlife", limit: 3 }
    @profile = client.search('33127', parameters)
  end

  def venues_search
    if params[:name]
      # venues is a hash, with keys that represents different type of results
      # see "Response Fields" in this page: https://developer.foursquare.com/docs/venues/search.html
      # for more details
      @venues = foursquare.venues.search(:query => params[:name], :ll => "#{latitude},#{longitude}")
    end
  end
  
  def venue_details
    # default venue is the "Tour Eiffel"
    @venue_id = params[:venue_id] || "185194"
    @venue = foursquare.venues.find(@venue_id)
  end

end