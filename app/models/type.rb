class Type < ActiveRecord::Base
  has_many :tags

  validates :name, presence: true

  #TODO: add length constraints on :name
end
