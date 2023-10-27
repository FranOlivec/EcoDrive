class CarsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin_role, only: [:new, :create, :edit, :update, :destroy]


  # GET /cars or /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1 or /cars/1.json
  def show
    @car = Car.find_by(id: params[:id])
    unless @car
      redirect_to cars_path, alert: "El coche solicitado no se encuentra"
    end
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:model, :brand, :features[], :fabrication_year, :autornomy, :prece, :imag)
    end

    private

    def check_admin_role
      unless current_user && current_user.role == "admin"
        redirect_to root_path, alert: "No tienes permiso para modificar este vehículo."
      end
    end

    def rent
      
    end
    
    def add_comment
     
    end
end
