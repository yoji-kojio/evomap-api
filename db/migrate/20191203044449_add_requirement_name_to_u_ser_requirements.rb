class AddRequirementNameToUSerRequirements < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requirements, :requirement_name, :string
  end
end
