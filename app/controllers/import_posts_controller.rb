class ImportPostsController < ApplicationController
  
  def new
    @import_post = ImportPost.new
  end
  
  def create
    @import_post = ImportPost.new(import_posts_params)
    # @import_post.attributes = { :user_id => session[:user_id] }
    
    if @import_post.save
      redirect_to posts_url, notice: 'Posts imported successfully.'
    else
      render :new
    end
  end
  
  private 
  
  def import_posts_params
    params.require(:import_post).permit(:file, :user_id)
  end
end
