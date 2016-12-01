class WelcomeController < ApplicationController
		include YelpTools
	def index
		YelpTools.client
		@profile=YelpTools.search('33127', { term: "Nightlife", limit: 3 })
		
		# client = Yelp::Client.new({
		# 	consumer_key: ENV["CONSUMER_KEY"],
		# 	consumer_secret: ENV["CONSUMER_SECRET"],
  # 		token: ENV["TOKEN"],
  # 		token_secret: ENV["TOKEN_SECRET"]
		# })
  # 	parameters = { term: "Nightlife", limit: 3 }
    # @profile = client.search('33127', parameters)
  end
end