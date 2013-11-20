class AddCompleteRmCompleted < ActiveRecord::Migration
  def change
  	add_column :todos, :complete, :boolean
  	remove_column :todos, :completed
  end
end
