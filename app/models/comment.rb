class Comment < ActiveRecord::Base
    belongs_to :article
    validates :name, :presence => { :message => "不能為空白" } ,
              :length => { :minimum => 2, :maximum => 254, :message => "至少2個字" }
    validates :comment, :presence => { :message => "不能為空白" },
              :length => { :minimum => 5, :message => "至少5個字"}
end
