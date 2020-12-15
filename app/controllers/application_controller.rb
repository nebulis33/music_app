class ApplicationController < ActionController::Base
    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def require_logged_in!
        redirect_to new_session_url if !logged_in?
        # redirect to new session then back to og url?
    end
end
