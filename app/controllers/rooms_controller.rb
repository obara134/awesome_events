class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = UserRoom.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = UserRoom.create(params.require(:user_room).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @user_rooms = @room.user_rooms
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
