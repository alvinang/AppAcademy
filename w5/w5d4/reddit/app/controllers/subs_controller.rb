class SubsController < ApplicationController

  before_action :moderator_only, only: [:edit, :destroy, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
     5.times { @sub.links.build }
    render :new
  end

  def create
    @sub = Sub.new(subs_params)

    @sub.moderator_id = current_user.id
    if @sub.save
      @sub.links.create(link_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update_attributes(subs_params)
    if @sub
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  private
  def subs_params
    params.require(:sub).permit(:name)

  end

  def moderator_only
    @sub = Sub.find(params[:id])
    redirect_to subs_url unless current_user.id == @sub.moderator_id
  end

  def link_params
    params.permit(:link => [:title, :url])
      .require(:link)
      .values
      .reject { |data| data.values.all?(&:blank?) }
  end

end
