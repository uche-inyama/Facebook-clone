class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      @posts = current_user.posts.order('updated_at DESC')
      @post = Post.new
    end

    def new
      @post = Post.new
    end

    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:success] = 'Post successfully created'
        redirect_to posts_path
      else
        flash.now[:danger] = 'Post cannot be blank'
        render 'new'
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find_by(id: params[:id])
      if @post.update(post_params)
        flash[:success] = 'Post successfully edited'
        redirect_to posts_path
      else
        flash.now[:danger] = 'Edit failed'
        render 'new'
      end
    end

    def destroy
      @post = Post.find_by(id: params[:id])
      @post.delete
      flash[:success] = 'Post deleted'
      redirect_to posts_path
    end

    private

    def post_params
      params.require(:post).permit(:body)
    end
end
