class AddPostsCounterToBloggers < ActiveRecord::Migration[7.0]
  def change
    add_column :bloggers, :post_counter, :integer, default: 0
  end
end
