require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  setup do
    @car = cars(:one)
  end

  test "visiting the index" do
    visit cars_url
    assert_selector "h1", text: "Cars"
  end

  test "should create car" do
    visit cars_url
    click_on "New car"

    fill_in "Año fabricacion", with: @car.año_fabricacion
    fill_in "Caracteristicas", with: @car.caracteristicas
    fill_in "Imagen", with: @car.imagen
    fill_in "Marca", with: @car.marca
    fill_in "Modelo", with: @car.modelo
    fill_in "Precio alquiler", with: @car.precio_alquiler
    fill_in "Rango conduccion", with: @car.rango_conduccion
    click_on "Create Car"

    assert_text "Car was successfully created"
    click_on "Back"
  end

  test "should update Car" do
    visit car_url(@car)
    click_on "Edit this car", match: :first

    fill_in "Año fabricacion", with: @car.año_fabricacion
    fill_in "Caracteristicas", with: @car.caracteristicas
    fill_in "Imagen", with: @car.imagen
    fill_in "Marca", with: @car.marca
    fill_in "Modelo", with: @car.modelo
    fill_in "Precio alquiler", with: @car.precio_alquiler
    fill_in "Rango conduccion", with: @car.rango_conduccion
    click_on "Update Car"

    assert_text "Car was successfully updated"
    click_on "Back"
  end

  test "should destroy Car" do
    visit car_url(@car)
    click_on "Destroy this car", match: :first

    assert_text "Car was successfully destroyed"
  end
end
