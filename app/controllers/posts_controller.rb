class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
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

   def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = "111111"

       user.name = "ゲスト"

    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end
end
