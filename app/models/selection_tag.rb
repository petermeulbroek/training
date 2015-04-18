class SelectionTag < ActiveRecord::Base
  belongs_to :selection
  belongs_to :tag
end
