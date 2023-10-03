require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Munana', photo: 'https://placehold.co/200x133', bio: 'He is good programmer')
    @post1 = Post.create(title: 'new year', author: @user, text: 'I am enjoying this new year')
    @post2 = Post.create(title: 'Get it right and getting it wrong', author: @user, text: 'You are wrong nor right')
    Comment.create(post: @post1, author: @user, text: 'great job man')
    Like.create(post: @post1, author: @user)
  end
  describe 'User Index  pages' do
    before(:each) { visit user_posts_path(@user) }
    it 'User index page contents user name, picture and Number of posts' do
      expect(page.has_xpath?("//img[@src='https://placehold.co/200x133']"))
      expect(page).to have_content('Munana')
      expect(page).to have_content('Number of posts: 2')
    end
    it 'Display post body with title and text' do
      expect(page).to have_content('new year')
      expect(page).to have_content('I am enjoying this new year')
    end
    it 'Display comments and like and their numbers' do
      expect(page).to have_content('great job man')
      expect(page).to have_content('Comment: 1')
      expect(page).to have_content('Likes: 1')
      expect(page).to have_content('1')
    end
    it "clicking on a post, it redirects me to that post's show page" do
      visit user_posts_path(@user, page: 1)
      click_link('new year')
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
    it 'check for pagination section' do
      expect(page).to have_selector('.pagination')
    end
  end
end
