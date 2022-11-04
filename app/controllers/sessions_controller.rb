class SessionsController < ApplicationController
  def create
    user = User.find_by(google_id: auth[:uid])
    if user.nil?
      user = User.create(user_params)
    end

    session[:user_id] = user.id
    flash[:success] = "You have logged in"
    redirect_to '/dashboard'
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have logged out"
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def user_params
    {google_id: auth[:uid],
    email: auth[:info][:email],
    token: auth[:credentials][:token],
    image: auth[:info][:image],
    first_name: auth[:info][:first_name],
    last_name: auth[:info][:last_name]}
  end
end
