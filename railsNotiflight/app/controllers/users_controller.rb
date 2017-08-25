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
        @airports = Airport.all.order('iata')
        @flights = @user.flights
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation,:image)
        end

        def auth
            return redirect_to root_path unless session[:user_id].to_s == params[:id]
        end
end
