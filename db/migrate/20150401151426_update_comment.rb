class UpdateComment < ActiveRecord::Migration
  def change
    rename_column :comments, :post_id, :article_id
    add_index :comments, :article_id
    add_index :articles, :user_id
  end
end
