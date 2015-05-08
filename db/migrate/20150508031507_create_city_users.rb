class CreateCityUsers < ActiveRecord::Migration
  def change
    create_table :city_users do |t|
      t.belongs_to :user
      t.belongs_to :city
      t.timestamps null: false
    end
  end
end
