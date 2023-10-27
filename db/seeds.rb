# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Número inicial para el modelo
model_number = 1

# Número de registros que quieres crear
num_of_cars = 20

num_of_cars.times do
  car_model = "ELECTRO-#{model_number}"
  
  Car.create(
    model: car_model,
    brand: Faker::Vehicle.make,
    features: Car::FEATURES_OPTIONS.sample(rand(1..3)), # Esto asume que tienes FEATURES_OPTIONS definido en tu modelo Car.
    fabrication_year: Faker::Number.between(from: 2010, to: Date.today.year),
    autonomy: Faker::Number.between(from: 50, to: 500),
    price: Faker::Commerce.price(range: 20_000..100_000.0, as_string: true).to_f,
    
  )
  model_number += 1
end
