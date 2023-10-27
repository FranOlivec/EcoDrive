json.extract! car, :id, :modelo, :marca, :caracteristicas, :año_fabricacion, :rango_conduccion, :precio_alquiler, :imagen, :created_at, :updated_at
json.url car_url(car, format: :json)
