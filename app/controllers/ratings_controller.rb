class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @rating = Rating.create
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show

  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create

   if request.xhr? #ajax request
    @rating = Rating.find_or_create_by(rating: params[:rating].to_i, place_id: params[:place_id], user_id: current_user.id)
      render :nothing => true, :status => 201 
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
  end

 
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:rating, [:id, :rating])
    end
end
