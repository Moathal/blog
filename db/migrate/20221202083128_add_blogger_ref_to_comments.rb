class AddBloggerRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author, null: false, foreign_key: {to_table: :bloggers}
  end
end
