class Like < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  def update_likes_count
    post.update!(likes_counter: post.likes.count)
  end
end
