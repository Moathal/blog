class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_posts_num

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true
  validates_length_of :title, minimum: 2, maximum: 250
  validates_numericality_of :comments_counter, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :likes_counter, only_integer: true, greater_than_or_equal_to: 0

  private

  def update_posts_num
    author.update(post_counter: author.posts.count)
  end
end
