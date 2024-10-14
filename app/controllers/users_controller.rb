# app/controllers/users_controller.rb
class UsersController < ApplicationController
  
    def index
        users = User.where(logged_in: true)
        render json:{ users:users }, status: :ok
    end

  end
  