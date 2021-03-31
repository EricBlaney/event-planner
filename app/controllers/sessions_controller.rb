class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])

        if @user
            session[:user_id] = @user.id
            redirect_to root_path
        else
            message = "Something went wrong!  Check your username and password are correct."
            redirect_to login_path, notice: message
        end
    end

    def destroy
       session[:user_id] = nil
       redirect_to root_path, notice: "logged out!" 
    end
end