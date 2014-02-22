class NotesController < ApplicationController
  
  before_action :view_if_logged_in
  
  def new
    @note = Note.new
    render :new
  end
  
  def create
    @note = Note.new(note_params)
    @note.track_id = params[:track_id]
    @note.user_id = current_user.id
    
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end
  
  def destroy
    @note = Note.find_by_id(params[:id])
    track_id = @note.track_id
    @note.delete
    redirect_to track_url(track_id)
  end
  
  private
  
  def note_params
    params.require(:note).permit(:body)
  end
  
end
