class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  include YelpTools
  # GET /places
  # GET /places.json
  def index
     profile=YelpTools.search('33127', yelp_parameters("Nightlife", 40))
     @image_urls=[]
     
     profile.businesses.each do |biz|
        biz.image_url
        found_place=Place.find_or_create_by(name: biz.name, address: biz.location.address.flatten.join, phone: biz.phone, city: biz.location.city, state_code: biz.location.state_code, postal_code: biz.location.postal_code, neighborhoods: get_neighborhood(biz), coordinate_latitude: biz.location.coordinate.latitude, coordinate_longitude: biz.location.coordinate.longitude, yelp_id: biz.id, image_url: biz.image_url)
        # found_place.image_url=biz.image_url
        @image_urls << biz.image_url
    end

    @places = Place.all
    
    unless session[:user_id]
      @places=Place.first 3
      @image_urls=@image_urls.slice 0,3
    end
  end

  def self.saved_places

  end


  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id])
  end
  def geo_address
    [street, city, state, country].compact.join(', ')
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json

  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rate
    binding.pry
    @place=Place.find(params[:id])
    @place.update_attributes(params.slice)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :address, :phone)
    end
    def yelp_parameters(terms,limits)
      { term: terms, limit: limits}
    end
end
