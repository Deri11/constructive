class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_id
      t.string :comment_created_at
      t.string :body
      t.string :user_avatar_url
      t.string :user_id
      t.string :user_name
      belongs_to :shots, index: true
      t.timestamps null: false
    end
  end
end
