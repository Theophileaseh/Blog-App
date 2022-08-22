class RenamePostsToLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :posts_counter, :likes_counter
  end
end
