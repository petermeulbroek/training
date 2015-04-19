class AddOrdinalToSelection < ActiveRecord::Migration
  def change
    add_column :selections, :ordinal, :integer
  end
end
