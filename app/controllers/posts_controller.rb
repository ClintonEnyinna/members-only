class PostsController < ApplicationController
  before_action :check_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(post_params)
    redirect_to root_path
  end

  private

  def check_user
    unless logged_in?
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end 
end
