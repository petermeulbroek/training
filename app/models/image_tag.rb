class ImageTag < ActiveRecord::Base
  belongs_to :image

  validates :name, :value, presence: true

  # TODO:  add length constrints on :name, :value
end
