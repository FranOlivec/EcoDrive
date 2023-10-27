class RentalController < ApplicationController
    def create
        @rental = Rental.new(rental_params)
        @rental.user = current_user 
    
        if @rental.save
          redirect_to @rental.car, notice: 'Alquiler realizado con éxito.'
        else
          flash[:alert] = "Error al realizar el alquiler."
          redirect_to @rental.car
        end
          
      private
    
      def rental_params
        params.require(:rental).permit(:car_id, :start_date, :end_date, :total_price)
      end
    end
end
