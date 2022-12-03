class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_posts_num

  def recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_num
    author.update(post_counter: author.posts.count)
  end
end
