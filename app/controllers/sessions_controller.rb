class SessionsController < ApplicationController
  def new
  end

  # def create
  #   auth= request.env['omniauth.auth']
  #   session[:omniauth] = auth.except('extra')
  #   user = User.sign_in_from_omniauth(auth)
  #   session[:user_id]=user.id
  #   redirect_to root_url, notice: "You're now logged in"
  # end
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  # def create
  #   if request.env[‘omniauth.auth’]
  #     user = User.create_with_omniauth(request.env[‘omniauth.auth’])
  #     session[:user_id] = user.id    
  #     redirect_to user_path(user.id)
  #   else
  #     user = User.find_by_email(params[:email])
  #     user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to user_path(user.id)
  #   end
  # end



  # def destroy
  #   session[:user_id] = nil
  #   session[:omniauth] = nil
  #   redirect_to root_url.notice "You have been logged out"
  # end
  def destroy
    reset_session
    redirect_to root_url
  end
end


