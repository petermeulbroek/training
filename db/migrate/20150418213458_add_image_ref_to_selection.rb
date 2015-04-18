class AddImageRefToSelection < ActiveRecord::Migration
  def change
    add_reference :selections, :image, index: true
    add_foreign_key :selections, :images
  end
end
