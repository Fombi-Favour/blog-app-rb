class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :like_counter_update

  def like_counter_update
    post.increment!(:likes_counter)
  end
end
