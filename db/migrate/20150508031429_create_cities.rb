class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :photo_url #seed
      t.string :country
      t.string :description
      t.decimal :popularity, default: 0
      t.string :lat
      t.string :long
      t.timestamps null: false
    end
  end
end
