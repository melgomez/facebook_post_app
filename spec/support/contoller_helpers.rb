module ControllerHelpers
  def sign_in(user)
    request.session[:user_id] = user.id
  end
  
  def current_user
    User.find(session[:user_id])
  end
end