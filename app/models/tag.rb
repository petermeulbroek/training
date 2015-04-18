class Tag < ActiveRecord::Base
  belongs_to :type
  belongs_to :selection
  
  validates :value, presence: true

  #TODO:  add length constraints on :value
end
