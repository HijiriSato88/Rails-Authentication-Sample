class ApplicationController < ActionController::API
    include ActionController::Cookies # Cookieを使用するために必要

    def log_in(user)
        user.update(logged_in: true) 
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id]) 
        end
    end

    def logged_in?
      !current_user.nil?
    end

    def current_user?(user)
      user == current_user
    end

    def log_out
      if current_user
        current_user.update(logged_in: false)
        session.delete(:user_id)
        @current_user = nil
      end
    end

end
