class Selection < ActiveRecord::Base
  belongs_to :image
  has_many :tags
  
  validates :start_x, :start_y, :end_x, :end_y, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

end
