class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
    @genres = Genre.all
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = "投稿しました！！"
    else
       @posts = Post.all
       @user = current_user
       render :index
    end
  end

  def category
    @tags = Tag.all
  end

  def index
    @posts = params[:name].present? ? Tag.find(params[:name]).posts : Post.all
    @tags = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿内容を変更しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:title, :comment, :genre_id, :brand, :price, :post_image,  tag_ids: [])
  end
end
