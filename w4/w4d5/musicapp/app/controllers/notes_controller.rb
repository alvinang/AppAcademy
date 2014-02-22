class NotesController < ApplicationController
  
  def show
    
  end
  
  def new
    @note = Note.new
    render :new
  end
  
  def create
    @note = Note.new(note_params)
    @note.track_id = params[:track_id]
    # @note.user_id = @note.user.id
    
    if @note.save
      flash[:notice] = "Thank you for your note!"
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end
  
  private
  
  def note_params
    params.require(:note).permit(:body)
  end
  
end
