class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :follows, :followers]
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
    @following_users = @user.following_user
    @follower_users = @user.follower_user

    @currentUserEntry = Entry.where(user_id: current_user&.id)
    # ログインしているユーザーの情報取得
    @userEntry = Entry.where(user_id: @user.id)
    # メッセージ相手のユーザーの情報を取得
    if @user.id == current_user&.id
      # ユーザーのidとログインしているidが同じでなければ実行
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          next unless cu.room_id == u.room_id

          # 既にroomが作成されている場合
          @isRoom = true
          @roomId = cu.room_id
          # 既に作成されているroom_idを特定
        end
      end
      if @isRoom
      else
        # roomを新しく作成する記述
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
    params.require(:user).permit(:name, :email, :school_name, :address, :telephone_number, :teacher_name, :school_content,
                                 :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
