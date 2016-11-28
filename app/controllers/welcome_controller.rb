class WelcomeController < ApplicationController
	def index
  	 parameters = { term: "Nightlife", limit: 3 }
     @profile = Yelp.client.search('33127', parameters)
  end
end
