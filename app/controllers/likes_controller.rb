class LikesController < ApplicationController
  before_action :set_like, only: %i[show edit update destroy]

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show; end

  # GET /likes/new
  def new
    like = Like.new
    respond_to do |format|
      format.html { render :new, locals: { like: } }
    end
  end

  # GET /likes/1/edit
  def edit; end

  # POST /likes or /likes.json
  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    like = Like.new(user:, post:)
    respond_to do |format|
      format.html do
        if like.save
          like.update_likes_count
          flash[:notice] = 'Liked'
          redirect_to "/users/#{user.id}/posts/#{post.id}"
        else
          flash.now[:error] = 'Error: Like could not be saved'
          render :new, locals: { like: }
        end
      end
    end
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to like_url(@like), notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like.destroy

    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
