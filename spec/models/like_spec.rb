require 'rails_helper'

RSpec.describe Like, type: :model do
  describe Like do
    let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post1) { Post.new(author: user1, title: 'Hello', text: 'This is my first post') }
    let(:like1) { Like.new(user: user1, post: post1) }

    it 'object should be valid' do
      expect(like1).to be_valid
    end
  end
end
