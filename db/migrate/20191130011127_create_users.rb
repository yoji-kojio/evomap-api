class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :description
      t.integer :career_id

      t.timestamps
    end
  end
end
