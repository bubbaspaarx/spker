class AddEventDateToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :event_date, :date
  end
end
