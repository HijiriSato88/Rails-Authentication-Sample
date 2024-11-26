class UsersController < ApplicationController
  
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
    users = User.all
    fields = params[:fields]&.split(',')  

    if fields.present?
      users = users.select(fields.map(&:to_sym))
    end
    
    render json: { users: users }, status: :ok
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params) #@user.update(name: params[:name])
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :bad_request
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
