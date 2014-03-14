class CardAssignmentsController < ApplicationController
  
  def destroy
    user_id = params[:userID]
    card_id = params[:cardID]
    card_assignment = CardAssignment.where("user_id = ? AND card_id = ?", user_id, card_id)
    card_assignment = card_assignment[0]
    card_assignment.destroy
    render json: nil
  end
  

  private
  def card_assignment_params
    params.require(:card_assignment).permit(:user_id, :card_id)
  end
end
