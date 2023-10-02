require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Munana', photo: 'https://placehold.co/200x133', bio: 'He is good programmer')
    @post1 = Post.create(title: 'new year', author: @user, text: 'I am enjoying this new year')
    @post2 = Post.create(title: 'Get it right and getting it wrong', author: @user, text: 'You are wrong nor right')
    @post3 = Post.create(title: 'Get it right and getting it wrong', author: @user, text: 'You are wrong nor right')
  end

  describe 'show page should have contents' do
    before(:each) { visit user_path(id: @user.id) }
    it 'the User picture and name' do
      expect(page.has_xpath?("//img[@src='https://placehold.co/200x133']"))
      expect(page).to have_content('Munana')
    end
    it 'show the content Bio and posts' do
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Bio')
      expect(page).to have_content('new year')
      expect(page).to have_content('Get it right and getting it wrong')
    end
    it 'Display the link see all post' do
      expect(page).to have_link('See all posts', href: "/users/#{@user.id}/posts")
    end
    it 'redirect to see all posts' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
    it 'redirect to view post' do
      click_link('new year')
      expect(page).to have_current_path(user_post_path(user_id: @post1.author, id: @post1.id))
    end
    it 'asserts you can see the user\'s first 3 posts' do
      expect(page).to have_content(@post1.text)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@post3.text)
    end
  end
end
