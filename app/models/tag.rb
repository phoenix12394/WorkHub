class Tag < ActiveRecord::Base
  has_and_belongs_to_many :microposts
  attr_accessible :user_id, :micropost_id, :name
  has_and_belongs_to_many :users

  def size
    Tag.all.count
  end
end
