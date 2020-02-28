class PostsController < ApplicationController
  before_action :check_user, only: %i[new create]

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
    redirect_to root_path unless logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
