class CreateUserCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_careers do |t|
      t.boolean :enabled, :default => true
      t.references :user, foreign_key: true
      t.references :career, foreign_key: true

      t.timestamps
    end
  end
end
