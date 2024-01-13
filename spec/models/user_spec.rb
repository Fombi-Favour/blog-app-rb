require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'post_counter should be present' do
    subject.post_counter = 1
    expect(subject.post_counter).to eq(1)
  end

  it 'post_counter should be an integer only' do
    subject.post_counter = 'a'
    expect(subject).not_to be_valid
  end

  it 'post_counter should be greater than or equal to zero' do
    subject.post_counter = -2
    subject.valid?
    expect(subject.errors[:post_counter]).to include('must be greater than or equal to 0')
  end

  describe 'recent post' do
    before do
      5.times do
        Post.create(author_id: subject.id, title: 'title1', text: 'text1')
      end
    end
    it 'should display recent post' do
      expect(subject.recent_post).to eq subject.posts.limit(3).order(created_at: :desc)
    end
  end
end
