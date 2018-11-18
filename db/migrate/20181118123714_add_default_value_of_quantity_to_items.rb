class AddDefaultValueOfQuantityToItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :quantity, :integer, null: false, default: 1
  end

  def down
    change_column :items, :quantity, :integer, null: false
  end
end
