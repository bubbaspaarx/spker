class AddIsPaidToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_paid, :boolean
  end
end
