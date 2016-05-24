class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_id 
      t.belongs_to :shots, index: true
      t.timestamps null: false
    end
  end
end
