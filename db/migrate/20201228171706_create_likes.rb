class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :favorites
      t.belongs_to :user, null: false, foreign_key: true
      t.references :post, polymorphic: true
      t.timestamps
    end
  end
end
