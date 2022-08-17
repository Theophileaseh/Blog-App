class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  private

  def update_comments_count
    post.update(comments_counter: post.comments.size)
  end
end
