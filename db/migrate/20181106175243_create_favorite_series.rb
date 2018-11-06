class CreateFavoriteSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_series do |t|
      t.string :series_id
      t.string :title
      t.string :thumbnail
      t.integer :start_year
      t.integer :end_year
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
