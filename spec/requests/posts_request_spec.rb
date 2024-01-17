require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET users/:id/posts' do
    it 'renders a successful response' do
      get '/users/1/posts'
      expect(response).to be_successful
    end

    it 'response body should render a correct placeholder text' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response.body).to include('All posts list')
    end
  end
end
