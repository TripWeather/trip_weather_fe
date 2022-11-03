class SessionsController < ApplicationController
  def new
    render :new
  end

  def create

    user = User.find_or_create_by(email: user_params[:email])
    user.update(user_params)

    session[:user_id] = user.id

    redirect_to '/dashboard'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def user_params
    {google_id: auth['uid'],
    email: auth['info']['email'],
    token: auth['credentials']['token'],
    image: auth['info']['image'],
    first_name: auth['info']['first_name'],
    last_name: auth['info']['last_name']}
  end


end
