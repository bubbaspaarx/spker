class RemoveTimeFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :start_time, :string
    remove_column :events, :end_time, :string
  end
end
