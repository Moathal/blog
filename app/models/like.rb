class Like < ApplicationRecord
  belongs_to :author, class_name: 'Blogger', foreign_key: 'post_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  after_save :update_likes_num

  private

  def update_likes_num
    post.update(likes_counter: post.likes.count)
  end
end
