class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  def most_recent_five_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.update(posts_counter: user.posts.size)
  end
end
