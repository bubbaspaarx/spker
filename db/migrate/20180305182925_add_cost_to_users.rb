class AddCostToUsers < ActiveRecord::Migration[5.1]
  def change
    add_monetize :users, :cost, currency: { present: false }
  end
end
