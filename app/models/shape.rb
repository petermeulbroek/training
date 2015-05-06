class Shape < ActiveRecord::Base

  belongs_to :annotation
  
  validates :x, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :y, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :width, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :height, presence: true, numericality: { greater_than_or_equal_to: 0 }

  
end
