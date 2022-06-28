class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])

   @following_users = @user.following_user
  @follower_users = @user.follower_user


    @currentUserEntry = Entry.where(user_id: current_user&.id)
    # ログインしているユーザーの情報取得
    @userEntry = Entry.where(user_id: @user.id)
    # メッセージ相手のユーザーの情報を取得
    if @user.id == current_user&.id
      # ユーザーのidとログインしているidが同じなら表示しない
    else
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
        @entry = Entry.new
      end
    end
  end


   def follows
  user = User.find(params[:id])
  @users = user.following_user
end

  def followers
  user = User.find(params[:id])
  @users = user.follower_user
end

  private

  def user_params
    params.require(:user).permit(:name, :email, :school_name, :telephone_number, :teacher_name, :school_content, :image)
  end
end
