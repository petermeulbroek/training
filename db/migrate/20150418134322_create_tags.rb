class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :type, index: true
      t.string :value

      t.timestamps null: false
    end
    add_foreign_key :tags, :types
  end
end
