class AddMentorRolesToMentor < ActiveRecord::Migration[5.1]
  def change
    add_column :mentors, :mentor_roles, :string, array: true, default: [].to_yaml
  end
end
