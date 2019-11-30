class CreateUserRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requirements do |t|
      t.boolean :finished
      t.references :user, foreign_key: true
      t.references :requirement, foreign_key: true

      t.timestamps
    end
  end
end
