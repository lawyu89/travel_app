class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :description
      t.string :photo_url
      t.integer :rank #trip advisor rank
      t.string :query_slug
      t.string :top_quote
      t.string :lat
      t.string :long
      t.decimal :popularity, default: 0 #our rank
      t.timestamps null: false
      t.string :category
      t.belongs_to :city
    end
  end
end
