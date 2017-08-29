class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid?
          session[:user_id] = user.id
          return redirect_to users_path
        else
          flash[:errors] = user.errors.full_messages
          return redirect_to root_path
        end
    end

    def show
        @user = current_user
        @airports = Airport.all.map { |n| n.iata.to_s + " " + n.name.to_s }
        @flights = @user.flights
    end

    def search
        airports = Airport.where("name LIKE ? OR iata LIKE ?", "%#{ params[:query] }%", "%#{ params[:query] }%").limit(10)
        @airports = airports.map{ |n| n.iata }
        
        p @airports
        # @airports = ["1","2","3"]
        render json: @airports
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation,:image)
        end

        def auth
            return redirect_to root_path unless session[:user_id].to_s == params[:id]
        end
end
