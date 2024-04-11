# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_correct_user, only: [:edit]
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    return unless @user.nil?

    redirect_to users_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ようこそ！！"
      redirect_to user_url(@user)
    else
      render 'users/new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    return unless @user.nil?

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def check_correct_user
    redirect_to(root_url, status: :see_other) unless logged_in? && (params[:id] == current_user_id)
  end
end
