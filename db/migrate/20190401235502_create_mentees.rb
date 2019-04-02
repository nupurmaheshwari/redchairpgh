class CreateMentees < ActiveRecord::Migration[5.1]
  def change
    create_table :mentees do |t|
      t.boolean :is_active
      t.string :current_role
      t.string :mentor_role
      t.string :skill_1
      t.string :skill_2
      t.string :skill_3
      t.integer :years_in_field
      t.boolean :lead_team
      t.string :mentor_gender
      t.string :comm_frequency
      t.text :bio
      t.text :in_five_years

      t.timestamps
    end
  end
end
