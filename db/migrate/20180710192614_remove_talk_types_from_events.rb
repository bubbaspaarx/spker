class RemoveTalkTypesFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :talk_type, :string
  end
end
