class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    # @roomに紐づくidと現在ログインしているユーザーのidを保存させるための記述
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    # 相手の情報を保存
    redirect_to "/rooms/#{@room.id}"
  end

  def index
    # ログインユーザー所属ルームID取得
    current_entries = current_user.entries
    my_room_id = []
    current_entries.each do |entry|
      my_room_id << entry.room.id
    end
    # 自分のroom_idでuser_idが自分じゃないのを取得
    @another_entries = Entry.where(room_id: my_room_id).where.not(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      # 現在ログインしているユーザーidとそれに紐づくroomidがあるのか条件分岐している
      @messages = @room.messages
      # メッセージを表示させる
      @message = Message.new
      # 新しいメッセージを作成する
      @entries = @room.entries
      # ユーザーの名前などを表示させるための記述
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
