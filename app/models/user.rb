class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :posts_counter, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :name, presence: true

  def most_recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
