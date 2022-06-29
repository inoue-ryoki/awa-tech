class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:destroy]

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
      if post.destroy
      redirect_to root_path
    end
  end


  def search

    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end
end
