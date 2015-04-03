class Article < ActiveRecord::Base
    belongs_to :user
    has_many :comments, :dependent => :destroy
    validates :title, :presence => { :message => "不能為空白" } ,
              :length => { :minimum => 2, :maximum => 254, :message => "至少2個字" }
    validates :content, :presence => { :message => "不能為空白" },
              :length => { :minimum => 5, :message => "至少5個字"}
end
