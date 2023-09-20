class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comment
  def update_post_comment
    posts.increment!(:comments_counter)
  end
end
