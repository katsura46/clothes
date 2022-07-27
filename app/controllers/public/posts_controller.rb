class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @tags = Tag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      genres = Vision.get_image_data(@post.post_image)
      genres.each do |genre|
        @post.genres.create(name: genre)
      end
      redirect_to post_path(@post)
      flash[:notice] = "投稿しました！！"
    else
       @posts = Post.page(params[:page])
       @user = current_user
       @tags = Tag.all
       render :new
    end
  end

  def category
    @tags = Tag.all
  end

  def index
    @post = Post.new
    @posts = params[:name].present? ? Tag.find(params[:name]).posts.page(params[:page]) : Post.page(params[:page])
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
    @tags = Tag.all
    if current_user.admin? || @post.user == current_user
      render "edit"
    else
      redirect_to posts_path
    end
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿内容を変更しました"
      redirect_to post_path(@post.id)
    else
      @tags = Tag.all
      flash[:alert] = "投稿内容の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :comment, :brand, :price, :post_image,  tag_ids: [])
  end
end
