class BoardsController < ApplicationController
  before_filter :require_login!
  
  def index
    @boards = Board.includes(:lists, :cards).for_member(current_user)
    
    @lists = []
    @boards.each { |board| @lists << board.lists }
    
    @cards = []
    @boards.each { |board| @cards << board.cards }
    @myID = current_user.id
    
    respond_to do |format|
      format.html  { render html: @boards }
      format.json { render json: @boards }
    end
  end
  
  def show
    @board = Board.find(params[:id])
    
    render json: @board
  end
  
  def create
    @board = current_user.boards.build(board_params)
    
    if @board.save
      render json: @board
    else
      render json: { errors: @board.errors.full_messages }, status: 422
    end
  end
  
  def update
    @board = Board.find(params[:id])
    @board.update_attributes(board_params)
    
    if params[:newMemberEmail]
      email = params[:newMemberEmail]
      new_member = User.find_by_email(email)
      new_member && !@board.members.include?(new_member) && @board.members << new_member
    end
    
    if @board.save
      render json: @board
    else
      render json: { errors: @board.errors.full_messages }, status: 422
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    render json: nil
  end
  

  private
  def board_params
    params.require(:board).permit(:title, :description)
  end
end
