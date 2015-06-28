module ApplicationHelper
  def authorize
    if session[:user_id] == @post.user_id
      return true
    else
      return false
    end
  end
end
