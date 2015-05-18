class Annotation < ActiveRecord::Base
  has_many :shapes
  belongs_to :image

  validates :text, presence: true
  
end
