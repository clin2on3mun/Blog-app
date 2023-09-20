class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :update_post_comment
  def recent_comments
    comments.order(created_at: :DESC).limit(5)
  end
  
  private

  def update_post_counter
    author.increment!(:posts_counter)
  end

end
