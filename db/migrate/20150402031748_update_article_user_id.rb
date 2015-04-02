class UpdateArticleUserId < ActiveRecord::Migration
  def change
    connection.execute(%q{
        alter table articles
        alter column user_id
        type integer using cast(user_id as integer)
    })
  end
end
