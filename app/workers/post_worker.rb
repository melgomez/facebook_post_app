class PostWorker
  include Sidekiq::Worker
  
  def perform(post_id)
    post = Post.find(post_id)
    post.update_attributes({:published => true, :publish_date => Time.now})
  end
  
end