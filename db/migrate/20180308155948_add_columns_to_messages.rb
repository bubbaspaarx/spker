class AddColumnsToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :event_name, :string
    add_column :messages, :address, :string
    add_column :messages, :postcode, :string
    add_column :messages, :proposal_cost, :integer
    add_column :messages, :start_time, :time
    add_column :messages, :end_time, :time
    add_column :messages, :photo, :string
    add_column :messages, :event_id, :integer
  end
end
