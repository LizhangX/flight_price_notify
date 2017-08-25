class FlightsController < ApplicationController
    def create
        flight = Flight.new(flight_params)
        flight.user = current_user
        flight.tracking = true
        unless flight.save
          flash[:notice] = flight.errors.full_messages
        else
          flash[:notice] = ["Successfully schedule!"]
        end
        return redirect_to users_path
    end

    private
        def flight_params
            params.require(:flight).permit(:departureAirport, :arrivingAirport, :departureDate, :returnDate, :lowerPrice, :upperPrice)
        end
    
end
