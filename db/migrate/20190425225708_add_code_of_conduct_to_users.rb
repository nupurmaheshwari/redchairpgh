class AddCodeOfConductToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :code_of_conduct, :boolean
  end
end
