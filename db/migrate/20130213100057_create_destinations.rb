class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.text :info
      t.text :todo
      t.text :airport
      t.text :rentcar
      t.text :weather
      t.float :lat
      t.float :lng
      t.boolean :gmaps
      t.string :address

      t.timestamps
    end
  end
end
