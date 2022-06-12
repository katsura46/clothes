class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to root_path
      flash[:notice] = "ジャンルを作成しました。"
    else
      @genres = Genre.all
      render :index
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
