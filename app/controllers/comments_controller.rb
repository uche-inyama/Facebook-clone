class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(id: comment_params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def edit
    @comment  = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to posts_path
    else
      flash.now[:danger] = 'Edit post failed'
      render 'edit'
    end
  end

  def destroy
    @comment  = Comment.find_by(id: params[:id])
    @comment.delete
    redirect_to posts_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
