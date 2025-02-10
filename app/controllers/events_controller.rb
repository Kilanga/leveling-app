class EventsController < ApplicationController
  def index
    events = Event.where(active: true)
    render json: { events: events }
  end
end
