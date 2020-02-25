class ApplicationController < ActionController::Base
    def log_in(user)
      update_remember_token(user)
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.token
    end

    def current_user?(user)
      current_user = user
    end

    def current_user
      if (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          @current_user = user
        end
      else
        @current_user ||= User.find_by(id: user_id)
      end
    end
end
