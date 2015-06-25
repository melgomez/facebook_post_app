class SessionsController < ApplicationController
  def create 
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = User.find_by_uid(user.uid).id
    redirect_to posts_url
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
