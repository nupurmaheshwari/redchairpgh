class AddStatusToMentorships < ActiveRecord::Migration[5.1]
  def change
    add_column :mentorships, :status, :string
  end
end
