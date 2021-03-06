class  Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page])
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    if current_user.admin? || @user == current_user
      render "edit"
    else
      redirect_to posts_path
    end
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

  def withdrawal

    @user = User.find(params[:user_id])
    @user.update(is_deleted: true)
    # current_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def favorites
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def log_out_confirm
  end

  def unsubscribe

  end
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email)
  end
end
