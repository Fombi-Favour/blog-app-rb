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
    expect(subject.post_counter).to eq(5)
  end

  it 'post_counter should be an integer only' do
    user1 = User.new(post_counter: 'a')
    user1.valid?
    expect(user1.errors[:post_counter]).to include('is not an integer')
  end

  it 'post_counter should be greater than or equal to zero' do
    user1 = User.new(post_counter: -2)
    user1.valid?
    expect(user1.errors[:post_counter]).to include('must be greater than or equal to zero')
  end
end
