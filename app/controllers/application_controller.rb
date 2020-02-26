class ApplicationController < ActionController::Base
    def log_in(user)
      session[:user_id] = user.id

      update_cookies(user)
    end

    def update_cookies(user)
      user.update_remember_token
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.token
    end

    def current_user?(user)
        user == current_user
    end

    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
    end
end
