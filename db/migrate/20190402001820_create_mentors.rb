class CreateMentors < ActiveRecord::Migration[5.1]
  def change
    create_table :mentors do |t|
      t.boolean :is_active
      t.string :current_role
      t.integer :years_in_field
      t.integer :years_in_lead
      t.string :gender
      t.string :comm_frequency
      t.text :bio
      t.text :motivation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
