class Api::PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors, status: 422
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: Post.all
  end

  def index
    @posts = Post.all
    respond_to do |format|
      format.html { render html: @posts }
      format.json { render json: @posts }
    end
  end

  def new
    @post = Post.new
    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    if @post && @post.update_attributes(post_params)
      render json: @post
    else
      render json: @post.errors, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
