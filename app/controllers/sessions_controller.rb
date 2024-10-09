class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          render json: { message: 'Logged in successfully', user: user }, status: :ok
        else
          render json: { message: 'Invalid email or password' }, status: :unauthorized
        end
    end
    
    def show
        if current_user
            render json: { user: current_user }, status: :ok
        else
            render json: { message: 'Not logged in' }, status: :unauthorized
        end
    end

    def destroy
        session[:user_id] = nil
        render json: { message: 'Logged out successfully' }, status: :ok
    end

end
