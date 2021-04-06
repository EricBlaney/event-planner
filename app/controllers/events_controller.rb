class EventsController < ApplicationController
    def index
        @events = Event.all.order("created_at DESC")
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)
        

        if @event.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
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

    def event_params
        params.require(:event).permit(:title, :description, :date, :location)
    end
end