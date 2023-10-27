class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :modelo
      t.string :marca
      t.text :caracteristicas
      t.integer :año_fabricacion
      t.integer :rango_conduccion
      t.integer :precio
      t.string :imagen

      t.timestamps
    end
  end
end
