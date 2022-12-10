class AddPostsCounterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :post_counter, :integer, default: 0
  end
end
