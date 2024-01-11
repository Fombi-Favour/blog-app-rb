require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe Comment do
    let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post1) { Post.new(author: user1, title: 'Hello', text: 'This is my first post') }
    let(:comment1) { Comment.new(post: post1, user: user1, text: 'Hi Tom!')}

    it 'object should be valid' do
      expect(comment1).to be_valid
    end
  end
end
