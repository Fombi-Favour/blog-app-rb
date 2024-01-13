require 'rails_helper'

RSpec.describe Like, type: :model do
  describe Like do
    let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 1) }
    let(:post1) { Post.new(author_id: user1.id, title: 'Hello', text: 'This is my first post', likes_counter: 2) }
    let(:like1) { Like.new(author: user1, post: post1) }

    before do
      user1.save
      post1.save
    end

    it 'object should be valid' do
      expect(like1).to be_valid
    end

    it 'like_counter should update' do
      expect(post1.likes_counter).to eq(2)
    end
  end
end
