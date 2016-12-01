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
end
