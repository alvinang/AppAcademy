class SubsController < ApplicationController

  before_action :moderator_only, only: [:edit, :destroy, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
     5.times { @sub.links.new }
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    
    filled_out_links = params[:link].values.reject do |value|
      value[:url].empty? || value[:title].empty?
    end

    filled_out_links.each do |link_params|
      @sub.links.new(link_params.merge(moderator_id: current_user.id))
    end
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      (5-@sub.links.length).times { @sub.links.new }
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    
    if @sub.update_attributes(subs_params)
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
  def sub_params
    params.require(:sub).permit(:name, :links => [:url, :title, :body])

  end

  def moderator_only
    @sub = Sub.find(params[:id])
    redirect_to subs_url unless current_user.id == @sub.moderator_id
  end

  # def link_params
  #   params.permit(:link => [:title, :url])
  #     .require(:link)
  #     .values
  #     .reject { |data| data.values.all?(&:blank?) }
  # end

end
