class SessionsController < ApplicationController
  
  def create
    auth = env['omniauth.auth']
    user = User.find_by_email(auth['info']['email']) || User.create_with_omniauth(auth)
    session[:user] = user
    redirect_to root_url
  end
  
  def destroy
    session[:user] = nil
    redirect_to root_url
  end
  
  def routingerror
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
end
