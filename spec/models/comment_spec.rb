require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe Comment do
    let(:user1) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    let(:post1) { Post.new(author: user1, title: 'Hello', text: 'This is my first post', comments_counter: 1) }
    let(:comment1) { Comment.new(author: user1, post: post1) }

    before do
      user1.save
      post1.save
    end

    it 'object should be valid' do
      expect(comment1).to be_valid
    end

    it 'comment_counter should update' do
      expect(post1.comments_counter).to eq(1)
    end
  end
end
