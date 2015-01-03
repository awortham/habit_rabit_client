require 'faraday'
require 'json'

module HabitRabbitClient
  class Event
    def initialize(host)
      @connection = Faraday.new(:url => host)
    end

    def find_event(id)
      data = JSON.parse( @connection.get("/api/v1/events/#{id}.json").body )
      Habit.new(data)
    end

    def all_events
      data = JSON.parse( @connection.get("/api/v1/events.json").body )
    end
  end
end
