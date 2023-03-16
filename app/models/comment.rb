class Comment < ApplicationRecord
  belongs_to :author, class_name: 'Blogger'
  belongs_to :post, class_name: 'Post'
  after_save :update_comments_num

  private

  def update_comments_num
    post.update(comments_counter: post.comments.count)
  end
end
