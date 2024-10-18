class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      render json: { message: 'ユーザーが追加され、ログインに成功しました', user: @user }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def index
    users = User.where(logged_in: true)
    render json: { users: users }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
