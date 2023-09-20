class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_post_likes_counter
  def update_post_likes_counter
    posts.increment!(:likes_counter)
  end
end
