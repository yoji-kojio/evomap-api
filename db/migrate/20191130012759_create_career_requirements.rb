class CreateCareerRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :career_requirements do |t|
      t.boolean :enabled
      t.references :career, foreign_key: true
      t.references :requirement, foreign_key: true

      t.timestamps
    end
  end
end
