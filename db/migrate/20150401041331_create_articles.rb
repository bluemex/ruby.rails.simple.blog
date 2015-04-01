class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :createTime
      t.datetime :updateTime
      t.string :userId

      t.timestamps null: false
    end
  end
end
