class CreateFavoriteCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_characters do |t|
      t.string :character_id
      t.string :name
      t.text :description
      t.string :thumbnail
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
