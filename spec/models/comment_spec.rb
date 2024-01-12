require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe Comment do
    let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post1) { Post.new(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 1) }

    before do
      user1.save
      post1.save
    end

    it 'object should be valid' do
      comment1 = Comment.new(author: user1, post: post1)
      expect(comment1).to be_valid
    end
  end
end
