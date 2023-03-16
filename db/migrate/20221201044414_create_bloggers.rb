class CreateBloggers < ActiveRecord::Migration[7.0]
  def change
    create_table :bloggers do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.string :timestamps

      t.timestamps
    end
  end
end
