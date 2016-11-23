class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
    render :json => User.all, status: 200
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      render :json => @user, status: 201
    else
      render :json => {error: "User validation failed"}, status: 400
    end
  end

  def show
    render :json => @user, status: 200
  end

  def edit
    render :json => @user, status: 200
  end

  def update
    if @user.update_attributes(update_user_params)
      render :json => {success: "User updated successfully"}, status: 204
    else
      render :json => {error: "Failed to update User"}, status: 400
    end
  end

  def destroy
    if @user.destroy
      render :json => {success: "User deleted successfully"}, status: 200
    else
      render :json => {error: "User deletion failed"}, status: 400
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: %w(name email neighborhood image password))
  end

  def update_user_params
    user_params.except(:password)
  end

end
