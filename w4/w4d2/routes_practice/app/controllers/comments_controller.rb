class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comments_params)
    @comment.user_id = params[:user_id]

    if @comment.save
      render :json => @comment
    else
      render :json => @comment.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    comment_dup = @comment.dup
    @comment.destroy

    render :json => comment_dup
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comments_params)
    if @comment.save
      render :json => @comment
    else
      render :json => @comment.errors.full_messages, :status => :unprocessable_entity
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:comment, :contact_id)
  end

end
