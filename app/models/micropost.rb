class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id, :location_id, :title, :category_id, :compensation
  belongs_to :user
  belongs_to :location
  belongs_to :category
  
  default_scope :order => 'microposts.created_at DESC'
  
  
  has_and_belongs_to_many :tags
  validates :title, :presence => true, :length => {:maximum => 100}
  validates_numericality_of :compensation, :on => :create
  validates :content, :presence => true, :length => {:minimum => 3, :maximum => 1000}
 # validates :user_id, :presence => true
 # validates :location_id, :presence => true

 def has_tag?(tag)
    self.tags.include?(tag)
  end
  
  def not_have_tags
    Tag.find(:all) - self.tags
  end

end
