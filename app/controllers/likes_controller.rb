class LikesController < ApplicationController
    def create 
       if params.include?"comment_id"
            @comment = Comment.find(params[:comment_id])
            @like = @comment.likes.create(user_id: current_user.id)
       elsif params.include?"post_id"
            @post = Post.find(params[:post_id])
            @like = @post.likes.build(user_id: current_user.id)
       end
       redirect_to request.referrer
    end
end
