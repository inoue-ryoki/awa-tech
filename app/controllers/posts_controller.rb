class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]

  def index
    @posts = Post.includes(:user).page(params[:page]).order('created_at DESC').per(8)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    redirect_to root_path if post.destroy
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def search_results
    @posts = Post.search(params[:keyword])

    respond_to do |format|
      format.html { redirect_to :root }
      # ↓検索結果のデータをレスポンスするコード
      format.json { render json: @posts }
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = '111111'

      user.name = 'ゲスト'
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end
end
