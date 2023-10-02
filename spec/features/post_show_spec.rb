# require 'rails_helper'

RSpec.feature 'Post Show', type: :feature do
    before(:each) do
        @user = User.create(name: 'Munana', photo: 'https://placehold.co/200x133', bio: 'He is good programmer')
        @post1 = Post.create(title:'new year', author: @user, text:'I am enjoying this new year')
        Comment.create(post: @post1, author: @user, text:'great job man')
        Like.create(post:@post1, author:@user)
    end
     describe 'User Index  pages' do
        before(:each) { visit user_post_path(@user, @post1) }
        it 'I can see the post title' do
            expect(page).to have_content("new year by: Munana")
        end
        it 'to show post text' do
            expect(page).to have_content('I am enjoying this new year')
        end
        it 'to show reaction of likes and comments' do
            expect(page).to have_content('Comment: 1')
            expect(page).to have_content('Likes: 1')
        end
        it 'to show post' do
            expect(page).to have_content('new year')
        end
        it 'to see the comment and user' do
            expect(page).to have_content("#{@user.name}: great job man")
        end
    end
end