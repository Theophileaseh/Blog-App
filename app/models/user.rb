class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

#   enum role: [:user, :admin]   after_initialize :set_default_role, 
#   :if => :new_record?    
# def set_default_role
#     self.role ||= :user   
# end

  validates :posts_counter, numericality: {
    only_integer: false,
    greater_than_or_equal_to: 0
  }
  validates :name, presence: true

  def most_recent_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
