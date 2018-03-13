class AddColumnsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :talk_type, :string
    add_column :events, :attendance, :integer
    add_column :events, :description, :text
    add_column :events, :expenses_flights, :boolean
    add_column :events, :expenses_hotels, :boolean
    add_column :events, :expenses_per_diems, :boolean
  end
end
