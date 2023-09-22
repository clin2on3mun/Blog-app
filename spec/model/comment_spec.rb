require 'rails_helper'

RSpec.describe Comment, Type: :model do
  describe 'comment model' do
    first_user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Poland.')
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    comment = Comment.new(post: first_post, author: first_user, text: 'Hi Tom!')

    it 'comment object to be valid' do
      expect(comment).to be_valid
    end
    it 'Comment text should be present' do
      comment.post = nil
      expect(comment).to_not be_valid
    end
    it 'Comment text should be present' do
      comment.author = nil
      expect(comment).to_not be_valid
    end
    it 'Comment text should be present' do
      comment.text = nil
      expect(comment).to_not be_valid
    end
  end
end
