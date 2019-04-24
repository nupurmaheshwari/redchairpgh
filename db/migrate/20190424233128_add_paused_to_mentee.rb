class AddPausedToMentee < ActiveRecord::Migration[5.1]
  def change
    add_column :mentees, :paused, :boolean
  end
end
