class FeedsController < ApplicationController
  def index

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => Feed.all }
    end
  end

  def show
    @feed = Feed.includes(:entries).find(params[:id])
    (Time.now - @feed.updated_at) > 2.minutes ? @feed.reload : false
    @entries = @feed.entries
  end

  def create
    feed = Feed.find_or_create_by_url(feed_params[:url])
    if feed
      render :json => feed
    else
      render :json => { error: "invalid url" }, status: :unprocessable_entity
    end
  end

  private
  def feed_params
    params.require(:feed).permit(:title, :url)
  end
end
