class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @ticket_comments = @user.ticket_comments
    
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

  private

   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end
end

