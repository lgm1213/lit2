class Yelp_Tools < ApplicationController
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
