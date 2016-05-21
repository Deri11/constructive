class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :id
      t.string :title
      t.string :description
      t.string :width
      t.string :height
      t.string :tags
      t.string :image_url
      t.string :image_path

      t.timestamps null: false
    end
  end
end
