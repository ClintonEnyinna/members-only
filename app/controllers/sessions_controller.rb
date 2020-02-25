class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password]))
      log_in @user
      current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
