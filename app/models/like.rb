class Like < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true

  def update_likes_count
    post.update!(likes_counter: post.likes.count)
  end
end
