class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :comment_counter_update

  def comment_counter_update
    post.increment!(:comment_counter)
  end
end
