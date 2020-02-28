class ApplicationController < ActionController::Base
  include ApplicationHelper

  def log_in(user)
    session[:user_id] = user.id

    update_cookies(user)
  end

  def log_out
    current_user.forget
    current_user_is(nil)
    session.delete(:user_id)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logged_in?
    current_user
  end

  def current_user_is(user)
    @current_user = user
  end

  private

  def update_cookies(user)
    user.update_remember_token
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.token
  end
end
