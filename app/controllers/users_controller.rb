class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
  require 'bcrypt'
  # GET /users
  # GET /users.json

  # def self.create_with_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth['provider']
  #     user.uid = auth['uid'
  #     user.name = auth['info']['name']
  #   end

  #   User.create()
  # end
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker| 
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
     if @user.save
      flash[:success] = "It's time to get LIT"
      log_in @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to '/signup'
    end

    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :zip, :country, :date_of_birth, :password_confirmation, :password)
    end
end