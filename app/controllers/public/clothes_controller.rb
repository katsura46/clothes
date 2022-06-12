class  Public::ClothesController < ApplicationController
  def new
    @clothe = Clothe.new
    @genres = Genre.all
  end

  def create
    @clothe = Clothe.new(clothe_params)
    @clothe.user_id = current_user.id
    if @clothe.save
      redirect_to clothe_path(@cloth)
      flash[:notice] = "投稿しました！！"
    else
       @clothes = Clothe.all
       @user = current_user
       render :index
    end
  end

  def index
    @clothes = Clothe.all
  end

  def show
    @clothe = Clothe.find(params[:id])
    @user = @clothe.user
  end

  def edit

  end

  def update

  end

  def destroy
  end

  private

  def clothe_params
    params.require(:clothe).permit(:title, :comment, :genre_id, :brand, :price, :clothe_image)
  end
end
