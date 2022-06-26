class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new]

  def index
     @posts = Post.includes(:user).order("created_at DESC")

  end

  def new
    @post = Post.new

  end

   def create
    Post.create(post_params)
  end


    private
  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end
end
