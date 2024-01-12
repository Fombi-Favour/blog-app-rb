require 'rails_helper'

RSpec.describe Post, type: :model do
  describe Post do
    it 'title should not exceed 250 characters' do
      post1 = Post.new(title: 'Hello' * 200)
      post1.valid?
      expect(post1.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'title should be present' do
      post1 = Post.new(title: 'first post')
      post1.title = nil
      expect(post1).not_to be_valid
    end

    it 'comments_counter should be an integer only' do
      post1 = Post.new(comments_counter: 'x')
      post1.valid?
      expect(post1.errors[:comments_counter]).to include('is not a number')
    end

    it 'likes_counter should be greater than or equal to zero' do
      post1 = Post.new(likes_counter: -1)
      post1.valid?
      expect(post1.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end
end
