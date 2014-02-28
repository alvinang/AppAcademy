class LinksController < ApplicationController

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(linger_params)
    sub_id = params[:sub_id]
    if @link.save
      LinkSub.create!(sub_id: sub_id, link_id: @link.id)
      redirect_to :back
      #redirect_to sub_urls #(sub_id)
    else
      flash[:errors] = @link.errors.full_messages
      redirect_to :back
    end
  end

  # we have to figure this sub can't be blank thing...........................................nest the route into subs so we can get the subway_ids

  def edit
  end

  def update

  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments_by_parent_id
    render :show
  end

  def destroy
  end

  private
  def linger_params
    params.require(:link).permit(:title, :url)
  end

end
