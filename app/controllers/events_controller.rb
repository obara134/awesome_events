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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "更新しました"
    else
      render :edit
    end
  end

  def dedtroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path, notice: "削除しました"
  end




  private

  def event_params
    params.require(:event).permit(:name, :place, :introduction, :start_at, :end_at)
  end

end
