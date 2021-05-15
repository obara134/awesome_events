class TicketCommentsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    comment = current_user.ticket_comments.new(ticket_comment_params)
    comment.event_id = event.id
    comment.save
    redirect_to event_path(event.id)
  end

  def destroy
    current_user.ticket_comments.where(event_id: params[:event_id]).destroy_all
    # TicketComment.find_by(id: params[:id], event_id: params[:event_id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private

  def ticket_comment_params
    params.require(:ticket_comment).permit(:comment)
  end

end
