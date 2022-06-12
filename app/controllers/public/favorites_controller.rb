class Public::FavoritesController < ApplicationController
  def create
    @cloth_favorite = Favorite.new(user_id: current_user.id, cloth_id: params[:cloth_id])
    @cloth_favorite.save
    redirect_to clothe_path(params[:cloth_id])
  end

  def destroy
    @cloth_favorite = Favorite.find_by(user_id: current_user.id, cloth_id: params[:cloth_id])
    @cloth_favorite.destroy
    redirect_to clothe_path(params[:cloth_id])
  end

end