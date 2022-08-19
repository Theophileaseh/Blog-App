class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_posts_count

  private

  def update_comments_count
    post.update(comments_counter: post.comments.size)
  end
end
