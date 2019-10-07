class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      @posts = current_user.posts
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
    end

    def update
    end

    def destroy
    end

    private

    def post_params
      params.require(:post).permit(:body)
    end
end
