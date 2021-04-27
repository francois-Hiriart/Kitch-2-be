class CreateKitchens < ActiveRecord::Migration[6.0]
  def change
    create_table :kitchens do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.text :equipments
      t.integer :size
      t.boolean :availability
      t.text :description
      t.string :picture

      t.timestamps
    end
  end
end
