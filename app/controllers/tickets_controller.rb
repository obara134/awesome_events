class TicketsController < ApplicationController

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @ticket.save
      redirect_to event_path(@event.id), notice: "このイベントに参加しました。"
  end


  private

  def event_params
    params.require(:ticket).permit(:comment)
  end


end
