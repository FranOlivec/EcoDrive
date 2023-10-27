class HomesController < ApplicationController
  def index
    if params[:search].present?
      @cars = Car.search(params[:search])
    else
      @cars = Car.all
    end
  end

  def about_us
   
  end

  def terms_and_conditions
    
  end
end
