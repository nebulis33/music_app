class SessionsController < ApplicationController
    def new
        render 'new'
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user.nil?
            redirect_to new_user_url
        else
            login_user!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        session[:session_token] = nil
        redirect_to new_session_url
    end
end
