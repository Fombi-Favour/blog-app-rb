require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user1) { User.new(id: 10) }
  let(:post1) { Post.new(id: 22, author_id: user1.id) }

  describe 'GET /index' do
    before { get user_posts_path(user1.id) }
    it 'renders a successful response and correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('All Posts list')
    end
  end

  describe 'GET /show' do
    before { get user_post_path(post1.author_id, post1.id) }
    it 'renders a successful response correct template' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Individual post')
    end
  end
 end
