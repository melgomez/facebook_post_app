class AddDefaultValueToPostPublishDate < ActiveRecord::Migration
  def change
    change_column(:posts, :publish_date, :datetime, default: Time.now)
  end
end
