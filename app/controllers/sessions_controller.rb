class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      log_in @user
      current_user_is(@user)
      flash[:success] = 'Successfully logged in!'
      redirect_to root_path
    else
      flash.now[:danger] = 'Incorrect email/password!'
      render 'new'
    end
  end

  def destroy
    flash[:success] = 'See you later!'
    log_out if current_user
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
