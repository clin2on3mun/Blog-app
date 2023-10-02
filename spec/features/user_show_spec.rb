require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
    before(:each) do
        @user = User.create(name: 'Munana', photo: 'https://placehold.co/200x133', bio: 'He is good programmer')
        @post1 = Post.create(title:'new year', author: @user, text:'I am enjoying this new year')
        @post2= Post.create(title:'Get it right and getting it wrong', author: @user, text:'You are wrong nor right')
    end
     
    describe 'show page should have contents' do
        before(:each) { visit user_path(id: @user.id) }
        it 'the User picture and name' do
            expect(page.has_xpath?("//img[@src='https://placehold.co/200x133']"))
            expect(page).to have_content('Munana')
        end
        it 'show the content Bio and posts' do
            expect(page).to have_content('Number of posts: 2')
            expect(page).to have_content('Bio')
            expect(page).to have_content('I am enjoying this new year')
            expect(page).to have_content('You are wrong nor right')
        end
        
    end 
end