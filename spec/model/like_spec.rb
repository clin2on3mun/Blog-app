require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '=> like model' do
    let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post) { Post.new(title: 'Never Give up', text: 'I am an enthusiast software developer') }

    it 'Post id should always be an integer' do
      like = Like.new(author: user.id, post: post.id)
      like.post = nil
      expect(like).to_not be_valid
    end
    it 'Post id should always be an integer' do
      like = Like.new(author: user.id, post: post.id)
      like.author = nil
      expect(like).to_not be_valid
    end
  end
end
