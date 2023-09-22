require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post model' do
    it('validate post title') do
      new_post = Post.new(title: '')
      new_post.valid?
      expect(new_post.errors[:title]).to include("can't be blank")
    end

    it 'title must be less than 250 characters' do
      new_post = Post.new(title: 'a' * 251)

      new_post.valid?

      expect(new_post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end
    it 'title comments counter to be integer' do
      new_post = Post.new(comments_counter: 'b')
      new_post.valid?
      expect(new_post.errors[:comments_counter]).to include('is not a number')
    end
    it 'title comments counter should be greater or equal to zero' do
      new_post = Post.new(comments_counter: -1)
      new_post.valid?
      expect(new_post.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end
    it 'title likes counter should be greater or equal to zero' do
      new_post = Post.new(likes_counter: -1)
      new_post.valid?
      expect(new_post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
    it 'title comments counter to be integer' do
      new_post = Post.new(likes_counter: 'b')
      new_post.valid?
      expect(new_post.errors[:likes_counter]).to include('is not a number')
    end
  end
end
