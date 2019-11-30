class CreateRequirementContents < ActiveRecord::Migration[5.2]
  def change
    create_table :requirement_contents do |t|
      t.boolean :enabled
      t.references :requirement, foreign_key: true
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
