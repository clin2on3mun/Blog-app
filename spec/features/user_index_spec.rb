require 'rails_helper'
RSpec.feature 'User Index', type: :feature do
  before(:each) do
    @user_one = User.create(name: 'Troos', photo: 'https://placehold.co/200x133', bio: 'She is good programmer')
    @user_two = User.create(name: 'Munana', photo: 'https://placehold.co/200x133', bio: 'He is good programmer')
    @user_one.posts.create(title: 'Post 1', text: 'This is the first post.')
    @user_one.posts.create(title: 'Post 2', text: 'This is the second post.')
    @user_one.posts.create(title: 'Post 3', text: 'This is the third post.')
    @user_two.posts.create(title: 'Post 1', text: 'This is the beginning.')
    @user_two.posts.create(title: 'Post 2', text: 'This is the progress.')
  end
  describe 'User index page' do
    before(:each) { visit users_path }
    it 'display container and user cards' do
      expect(page).to have_css('div.container')
      expect(page).to have_content('Troos')
      expect(page).to have_content('Munana')
    end
    it 'displays Users picture' do
      expect(page.has_xpath?("//img[@src='https://placehold.co/200x133']"))
    end
    it 'display the number of post create by the user' do
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Number of posts: 2')
    end
    it 'redirect from index to show by click to user' do
      click_link('Troos')
      visit user_path(@user_one)
      expect(page).to have_current_path(user_path(@user_one))
    end
  end
end
