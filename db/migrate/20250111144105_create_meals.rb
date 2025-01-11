class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :price
      t.references :category, null: false, foreign_key: true
      t.string :image_url
      t.decimal :rating

      t.timestamps
    end
  end
end
