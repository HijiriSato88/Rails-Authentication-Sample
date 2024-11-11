class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
            log_in user
            render json: { message: 'Logged in successfully', user: user }, status: :ok
        else
            render json: { message: 'Invalid email or password' }, status: :unauthorized
        end
    end
    
    def destroy
        if logged_in?
            user = current_user # ログアウトするユーザーを保存
            log_out
            render json: { message: 'Logged out successfully', user: user }, status: :ok
        else
            render json: { message: 'No user to log out' }, status: :unauthorized
        end
    end

end

