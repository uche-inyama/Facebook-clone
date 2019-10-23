# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).order(created_at: :DESC)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :DESC)
    @post = Post.new
    @comment = Comment.new
  end
end
