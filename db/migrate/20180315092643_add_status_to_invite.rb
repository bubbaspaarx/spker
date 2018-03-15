class AddStatusToInvite < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :status, :string
  end
end
