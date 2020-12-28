class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :category
      t.string :name
      t.text :ingredients
      t.text :directions
      t.string :image_url
      t.integer :time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
