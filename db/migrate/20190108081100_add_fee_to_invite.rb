class AddFeeToInvite < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :fee, :integer
  end
end
