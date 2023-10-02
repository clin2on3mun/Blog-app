require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Clinton', photo: 'https://placehold.co/200x133', bio: 'Teacher from UK.',
                      )
    @post = @user.posts.create(title: 'Hello', text: 'This is my first post.')
  end
  describe 'GET/users/1/posts' do
    it 'render a succesful response' do
      get "/users/#{@user.id}/posts"
      expect(response).to be_successful
    end
    it 'render index action with index view' do
      get "/users/#{@user.id}/posts"
      expect(response.status).to eql(200)
      expect(response.status).not_to eql(400)
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('Number of posts')
    end
    it 'render show action with show view' do
      get "/users/#{@user.id}/posts/#{@post.id}/"
      expect(response).to have_http_status(:success)
      expect(response.status).to eql(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('Hello')
    end
  end
end
