class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
    authorize! :read, @post
  end

  def create # rubocop:disable Metrics/MethodLength
    authorize! :read, post
    post = params[:post]
    user = User.find(params[:user_id])
    post = Post.new(post.permit(:title, :text))
    post.comments_counter = 0
    post.likes_counter = 0
    post.user_id = user.id
    respond_to do |format|
      format.html do
        if post.save
          post.update_posts_count
          # success message
          flash[:success] = 'Post saved successfully'
          # redirect to index
          redirect_to "/users/#{user.id}/posts"
        else
          # error message
          flash.now[:error] = 'Error: Post could not be saved'
          # render new
          render :new, locals: { post: }
        end
      end
    end

    def new # rubocop:disable Lint/NestedMethodDefinition
      authorize! :manage, post
      post = Post.new
      respond_to do |format|
        format.html { render :new, locals: { post: } }
      end
    end
  end
end
