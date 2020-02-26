class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      current_user_is(@user)
      redirect_to root_path
    else
      #redirect_to root_path
    end
  end
  
  def destroy
    log_out if current_user
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
