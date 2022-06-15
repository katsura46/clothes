class  Public::UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "プロフィールの更新に失敗しました"
      render :edit
    end
  end

  def favorites
    @user = current_user
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end


  def log_out_confirm
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email)
  end
end
