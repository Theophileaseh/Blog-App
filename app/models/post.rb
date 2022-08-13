class Post < ApplicationRecord
  belongs_to :user

  def most_recent_five_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.update(posts_counter: user.posts.size)
  end
end
