# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      p @user.errors.count
      redirect_to @user, alert: 'User created successfully'
    else
      redirect_to new_user_path, alert: 'Error creating user'
    end
  end

  private

  def user_params
    params.require(:user).permit :username, :password, :salt, :encrypted_password
  end
end
