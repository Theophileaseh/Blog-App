class Api::V1::CommentsController < ApplicationController
  protect_from_forgery with: :null_session
  def new
    @comment = Comment.new
    respond_to do |format|
      format.json { render json: @comment }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(post_id: @post.id, author_id: current_user.id, Text: comment_params)
    @comment.post_id = @post.id
    return unless
    @comment.save

    respond_to do |format|
      format.json { render json: @comment, status: 'Created' }
    end
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.find(params[:post_id])
    @comments = @posts.comments

    render json: @comments
  end

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
