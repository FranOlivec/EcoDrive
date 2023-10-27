class HomesController < ApplicationController
  def index
    if params[:search].present?
      @pagy, @cars = pagy(Car.search(params[:search]))
    else
      @pagy, @cars = pagy(Car.all)
    end
  end

  def about_us
    
  end

  def terms_and_conditions
    
  end
end
