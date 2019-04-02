class AddSpecializedSkillsToMentor < ActiveRecord::Migration[5.1]
  def change
    add_column :mentors, :specialized_skills, :string, array: true, default: [].to_yaml
  end
end
