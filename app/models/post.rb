class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :post_counter_update

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def post_counter_update
    author.increment(:post_counter)
  end
end
