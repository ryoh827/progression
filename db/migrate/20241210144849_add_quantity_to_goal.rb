class AddQuantityToGoal < ActiveRecord::Migration[8.0]
  def change
    add_column :goals, :quantity, :integer, null: false
  end
end
