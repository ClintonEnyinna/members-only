class PostsController < ApplicationController
  before_action :check_user, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Successfully created post'
      redirect_to root_path
    else
      render 'new'
    end    
  end

  private

  def check_user
    redirect_to root_path unless logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
