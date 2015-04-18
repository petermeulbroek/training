class RenameValidatedToReviewed < ActiveRecord::Migration
  def change
    rename_column :images, :validated, :reviewed
  end
end
