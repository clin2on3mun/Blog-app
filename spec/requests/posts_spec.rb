require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/users/1/posts' do
    it 'render a succesful response' do
      get '/users/1/posts'
      expect(response).to be_successful
    end
    it 'render index action with index view' do
      get '/users/1/posts'
      expect(response.status).to eql(200)
      expect(response.status).not_to eql(400)
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('List user posts')
    end
    it 'render show action with show view' do
      get '/users/1/posts/3'
      expect(response).to have_http_status(:success)
      expect(response.status).to eql(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('Show Post by id')
    end
  end
end
