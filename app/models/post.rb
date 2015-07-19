class Post < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id
  
  scope :publish_next_queue, lambda { order("publish_date ASC") }
  scope :unpublished, lambda{ where published: false }
  scope :less_than_five, lambda{ where publish_date: (Time.now - 30.days)..(Time.now + 5.minutes) }
  
  def self.next_for_publish
    Post.publish_next_queue.unpublished.less_than_five.first
  end
  
  def self.publish
    post = Post.next_for_publish
    if post.nil?
      return false
    else
      PostWorker.perform_at(post.publish_date, post.id)
    end
  end
end
