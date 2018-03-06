class AddCostToEvents < ActiveRecord::Migration[5.1]
  def change
    add_monetize :events, :cost, currency: { present: false }
  end
end
