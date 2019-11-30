class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
