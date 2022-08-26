class Comment < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :post, counter_cache: true
  after_save :update_comments_count

  def update_comments_count
    post.update(comments_counter: post.comments.size)
  end
end
