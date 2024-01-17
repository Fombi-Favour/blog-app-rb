require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do

    it 'renders a successful response' do
      get '/users'
      expect(response).to be_successful
    end

    it 'response body should render a correct placeholder text' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response.body).to include('All users list')
    end

    it 'should render a correct template' do
      get '/users/1'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to_not render_template('users/index')
      expect(response.body).to include('Individual user')
    end
  end
end
