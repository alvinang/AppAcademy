class LinksController < ApplicationController

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to :back
    else
      @subs = Sub.all
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @subs = Sub.all
    render :edit
  end

  def update
    if @link.update_attributes(link_params)
      redirect_to @link
    else
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end  
  end

  def show
    @link = Link.find(params[:id])
    @comments = @link.comments_by_parent_id
    render :show
  end

  def destroy
  end

  private
  def link_params
    params.require(:link).permit(:title, :url, :body, :user_id, :sub_ids)
  end

end
