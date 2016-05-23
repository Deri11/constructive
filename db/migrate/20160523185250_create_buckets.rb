class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|

      t.timestamps null: false
    end
  end
end
