class AddDefaultToAttendance < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :attendance, :integer, default: 0
  end
end
