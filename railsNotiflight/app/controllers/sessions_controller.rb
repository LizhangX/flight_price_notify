class SessionsController < ApplicationController
  def login
    user = User.find_by_email(params[:email])

    if user
      if user.try(:authenticate, params[:password])
        session[:user_id] = user.id
        return redirect_to users_path
      elsif user.provider
        flash[:errors] = ['You have already sign up through Google!','Please use google to sign up.']
      else
        flash[:errors] = ['Invalid Combination.']
      end
    else
      flash[:errors] = ['Invalid Comnination.']
    end
    return redirect_to root_path
    # user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    # if user
    #     session[:user_id] = user.id
    #     return redirect_to root_path
    # else
    #   if User.find_by_email(params[:email]).provider
    #     flash[:errors] = ['You have already sign up through Google!','Please use google to sign up.']
    #   else
    #     flash[:errors] = ['Invalid Combination']
    #   end
    #     return redirect_to root_path
    # end
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
    else
      flash[:errors] = ['The email is already sign up throught NotiFlight.']
      return redirect_to root_path
    end
    # binding.pry
    return redirect_to users_path
  end

  def destroy
    session[:user_id] = nil
    return redirect_to root_path
  end
end
