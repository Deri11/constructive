class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      has_many "shots", index: true
      t.timestamps null: false
    end
  end
end
