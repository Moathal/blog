class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  after_save :this.update_likes_num

  def self.update_likes_num
    post.update(likes_counter: post.likes.count)
  end
end
