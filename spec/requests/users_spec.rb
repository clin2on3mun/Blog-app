require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/users' do
    let(:user) { User.create(name: 'Denver', photo: 'https://placehold.co/200x133', bio: 'He is good programmer') }
    it 'renders a successful response' do
      get '/users'
      expect(response).to be_successful
    end
    it 'renders the index action with index view' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.status).to eql(200)
      expect(response.status).not_to eq(400)
      expect(response).to render_template('users/index')
      expect(response.body).to include('Please Add Users')
    end
    it 'renders the show action with show view' do
      get user_path(id: user.id)
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('Denver')
    end
  end
end
