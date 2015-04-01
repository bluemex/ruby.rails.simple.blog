class UpdateDb < ActiveRecord::Migration
  def change

    create_table :comments do |t|
        t.string :name
        t.text :comment
        t.integer :post_id
        t.timestamps
    end

    rename_column :articles, :userId, :user_id
    remove_column :articles, :updateTime
    remove_column :articles, :createTime
  end
end
