class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :get_picture
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  def get_picture(coordinates)
  	client2 = Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_CLIENT_ID'], :client_secret => ENV['FOURSQUARE_CLIENT_SECRET']) 
  	latitude=coordinates.latitude
  	longitude=coordinates.longitude
  	p @venues = client2.search_venues(:ll => "#{latitude},#{longitude}",v:"20161128",limit: 1)
  	@venue_id=@venues.venues.first.id


  	@photo=client2.venue_photos(@venue_id, v:"20161128", limit: 1)
  	@photo_prefix=@photo.items[0].prefix.chop!
  	@photo_suffix=@photo.items[0].suffix
  	@photo_url= @photo_prefix+@photo_suffix
  	@photo_url
  end
end
