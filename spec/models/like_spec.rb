require 'rails_helper'

RSpec.describe Like, type: :model do
  describe Like do
    let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post1) { Post.new(title: 'Hello', text: 'This is my first post', likes_counter: 1) }

    before do
      user1.save
      post1.save
    end

    it 'object should be valid' do
      like1 = Like.new(author: user1, post: post1)
      expect(like1).to be_valid
    end
  end
end
