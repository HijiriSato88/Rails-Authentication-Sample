# app/controllers/users_controller.rb
class UsersController < ApplicationController
    before_action :authorize_request
  
    def index
        users = User.where(logged_in: true)
        render json: users, status: :ok
    end
  
    private
  
    def authorize_request
      unless current_user
        render json: { message: 'Not authorized' }, status: :unauthorized
      end
    end
  end
  