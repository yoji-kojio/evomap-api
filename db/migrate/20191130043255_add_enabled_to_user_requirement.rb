class AddEnabledToUserRequirement < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requirements, :enabled, :boolean, :default => true
  end
end
