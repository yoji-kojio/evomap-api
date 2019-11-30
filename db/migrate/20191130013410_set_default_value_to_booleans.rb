class SetDefaultValueToBooleans < ActiveRecord::Migration[5.2]
  def change
    change_column :career_requirements, :enabled, :boolean, :default => true
    change_column :requirement_contents, :enabled, :boolean, :default => true
    change_column :user_requirements, :finished, :boolean, :default => false
  end
end
