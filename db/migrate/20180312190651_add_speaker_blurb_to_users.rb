class AddSpeakerBlurbToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :speaker_blurb, :text
  end
end
