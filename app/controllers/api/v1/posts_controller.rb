class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    render json: @posts
  end

  def show
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    # @comments = @post.comments
    render json: @posts
  end
end
