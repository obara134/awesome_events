class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ticket_comments = @user.ticket_comments

    # 以下はコメント機能
    @currentUserEntry = UserRoom.where(user_id: current_user.id)
    @userEntry = UserRoom.where(user_id: @user.id)
    if @user.id != current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @user_room = UserRoom.new
      end
    end
    # 以上はコメント機能
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールの更新が完了しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def past_index
    @user = User.find(params[:id])
  end

  def expect_index
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
