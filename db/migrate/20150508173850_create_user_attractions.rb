class CreateUserAttractions < ActiveRecord::Migration
  def change
    create_table :user_attractions do |t|
      t.belongs_to :user
      t.belongs_to :attraction
      t.integer :city_id
      t.boolean :preference
      t.timestamps null: false
    end
  end
end
