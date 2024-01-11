class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :post_counter_update

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def post_counter_update
    author.increment(:post_counter)
  end
end
