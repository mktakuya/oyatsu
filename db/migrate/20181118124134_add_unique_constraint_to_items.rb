class AddUniqueConstraintToItems < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :name, unique: true
  end
end
