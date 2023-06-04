class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
    authorize! :read, @post
  end

  # GET /posts/new
  def new
    authorize! :manage, @post
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

    private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :user_id, :text, :comments_counter, :likes_counter)
  end
end
