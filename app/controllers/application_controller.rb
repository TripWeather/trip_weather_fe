class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if current_user.nil?
      redirect_to '/'
      flash[:error] = "Please Log In"
    else
      @user = current_user
    end
  end

  def address_format(params)
    "#{params[:address]}, #{params[:city]}, #{params[:state]} #{params[:zipcode]}"
  end
  
end
