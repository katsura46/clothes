class Admin::UsersController < ApplicationController

  def top
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end