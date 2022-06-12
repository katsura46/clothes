class ChangeClothsToClothes < ActiveRecord::Migration[6.1]
  def change
    rename_table :cloths, :clothes
    create_table :clothes do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :title
      t.text :comment
      t.string :brand
      t.integer :price

      t.timestamps
    end
  end
end
