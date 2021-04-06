class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new 
        end
        
    end

    def edit
        @event = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
    end

    def rsvp
        @event = Event.find(params[:id])
        if @event.attendees.include?(current_user)
            redirect_to @event, notice: "You're already going!"
        else
            @event.attendees << current_user
            redirect_to @event
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
