class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to :back
    else
      flash[:errors] = @tag.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
  end
end
