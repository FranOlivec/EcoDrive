class RenameSpanishColumnsToEnglish < ActiveRecord::Migration[7.0]
  def change
        rename_column :cars, :modelo, :model
        rename_column :cars, :marca, :brand
        rename_column :cars, :caracteristicas, :features
        rename_column :cars, :año_fabricacion, :fabrication_year
        rename_column :cars, :rango_conduccion, :autonomy
        rename_column :cars, :precio, :price
        rename_column :cars, :imagen, :imag
    end
end
