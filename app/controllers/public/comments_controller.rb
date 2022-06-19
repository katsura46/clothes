class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :post_comments  #render先にjsファイルを指定
    else
      @post_new = Post.new
      @comments = @post.comments
      redirect_to post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :post_comments  #render先にjsファイルを指定

  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
