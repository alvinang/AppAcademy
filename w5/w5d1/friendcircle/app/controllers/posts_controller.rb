class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
    3.times { @post.links.build() }
    render :new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)
    # @post.user_id = current_user.id
    # @post.friend_circle_posts.friend_circle_ids = friend_circle_post_params
    @post.links.build(link_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to :index
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :friend_circle_ids => [])
  end

  def link_params
    params.permit(:link => [:title, :url])
            .require(:link)
            .values
            .reject { |data| data.all? {|key, value| value.blank? } }
  end

  # def friend_circle_post_params
  #   params.permit(:friend_circle_post => { :friend_circle_ids => [] })
  #     .require(:friend_circle_post)
  #     .require(:friend_circle_ids)
  # end
end
