class UpdateCars < ActiveRecord::Migration[7.0]
  def change
    change_column :cars, :features, :string, array: true, default: [], using: "(string_to_array(features, ','))"
    change_column :cars, :fabrication_year, :string
  end
end
