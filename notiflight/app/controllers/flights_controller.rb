class FlightsController < ApplicationController
  def index
  end
  
  def create
    flight = Flight.create(flight_params)
    unless flight.valid?
      flash[:notice] = flight.errors.full_messages
    else
      flash[:notice] = ["Successfully schedule!"]
    end
    return redirect_to '/'
  end

  private
    def flight_params
      params.require(:flight).permit(:fport, :tport, :ddate, :rdate, :email)
    end
end
