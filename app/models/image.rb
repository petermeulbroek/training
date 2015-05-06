class Image < ActiveRecord::Base

  has_many :selections
  has_many :image_tags
  has_many :annotations
  
  validates :url, presence: true, uniqueness: true
  validates_inclusion_of :reviewed, :in => [true, false]
  
end
