class TicketsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @comment = current_user.tickets.new(ticket_params)
    @comment.event_id = @event.id
    if @comment.save
      redirect_to event_path(@event.id)
      flash[:notice] = "このイベントに参加しました"
    else
      render 'events/show'
    end
  end


  private

  def ticket_params
    params.require(:ticket).permit(:comment)
  end


end

