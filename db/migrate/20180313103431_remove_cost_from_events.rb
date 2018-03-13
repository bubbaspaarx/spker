class RemoveCostFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :cost_cents, :string
  end
end
