class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :content
      t.string :image
      t.datetime :start_time

      t.timestamps
    end
  end
end
