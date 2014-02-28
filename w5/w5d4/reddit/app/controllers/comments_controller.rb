class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.link_id = params[:link_id]
    @comment.parent_comment_id = nil
    if @comment.save
      redirect_to :back
    else
      flash[:errors] = @comment.errors.full_messages
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
