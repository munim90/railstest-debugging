class AddOrderToTasks < ActiveRecord::Migration[6.0]
  def change
    change_table :tasks do |t|
      t.integer :project_order
    end
  end
end
