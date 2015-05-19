class Tag < ActiveRecord::Base
  belongs_to :type
  belongs_to :image
  
  validates :value, presence: true

  #TODO:  add length constraints on :value
end
