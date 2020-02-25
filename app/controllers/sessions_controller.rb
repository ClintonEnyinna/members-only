class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password]))
      current_user
      log_in @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
