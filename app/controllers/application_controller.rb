class ApplicationController < ActionController::API
    include ActionController::Cookies # Cookieを使用するために必要

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id]) 
        end
    end
  
    def authenticate_user!
      unless current_user
        render json: { message: 'Not authorized' }, status: :unauthorized
      end
    end

end
