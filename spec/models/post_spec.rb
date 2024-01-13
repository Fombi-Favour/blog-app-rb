require 'rails_helper'

RSpec.describe Post, type: :model do
  describe Post do
    before(:all) do
      @user1 = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
      @user1.save
      @post1 = Post.new(title: 'Lilly', text: 'Teacher from Poland.')
      @post1.save
      7.times do
        Comment.create(author_id: @user1.id, post_id: @post1.id, text: 'text1')
      end
    end

    it 'title should not exceed 250 characters' do
      @post1.title = 'Hello' * 200
      @post1.valid?
      expect(@post1.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'title should be present' do
      @post1.title = nil
      expect(@post1).not_to be_valid
    end

    it 'comments_counter should be an integer only' do
      @post1.comments_counter = 'x'
      @post1.valid?
      expect(@post1.errors[:comments_counter]).to include('is not a number')
    end

    it 'likes_counter should be greater than or equal to zero' do
      @post1.likes_counter = 'x'
      @post1.valid?
      expect(@post1.errors[:likes_counter]).to include('is not a number')
    end

    it 'post_counter should update' do
      initial = @user1.post_counter
      Post.create(author_id: @user1.id, title: 'title1', text: 'text1')
      @user1.reload
      expect(@user1.post_counter).to eq(initial + 1)
    end

    it 'should display recent comments' do
      expect(@post1.recent_comments).to eq @post1.comments.limit(5).order(created_at: :desc)
    end
  end
end
