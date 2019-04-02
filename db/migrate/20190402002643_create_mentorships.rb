class CreateMentorships < ActiveRecord::Migration[5.1]
  def change
    create_table :mentorships do |t|
      t.references :mentor, foreign_key: true
      t.references :mentee, foreign_key: true
      t.integer :match_score
      t.boolean :is_active
      t.boolean :mentee_approved
      t.boolean :mentor_approved

      t.timestamps
    end
  end
end
