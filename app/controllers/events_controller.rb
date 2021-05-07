class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:notice] = "イベントの作成が完了しました"
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end




  private

  def event_params
    params.require(:event).permit(:name, :place, :introduction, :start_at, :end_at)
  end

end
