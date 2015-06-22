class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :status
      t.boolean :published
      t.datetime :publish_date
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
