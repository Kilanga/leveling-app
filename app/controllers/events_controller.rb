class EventsController < ApplicationController
  def index
    events = [
      { id: 1, title: "Bonus XP du week-end", description: "Doublez votre XP ce week-end!" },
      { id: 2, title: "Événement spécial: Boss Raid", description: "Affrontez un boss pour gagner un item légendaire!" }
    ]
    render json: { events: events }
  end
end
