require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user1) { User.new(id: 735, name: 'name1') }

  describe 'GET /index' do
    before { get users_path }
    it 'renders a successful response and correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('All Users list')
    end
  end

  describe 'GET /show' do
    before { get user_path(user1.id) }
    it 'renders a successful response correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Individual user')
    end
  end
end
