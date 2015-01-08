require 'faraday'
require 'json'

module HabitRabbitClient
  class Habit

    def initialize(host)
      @connection = Faraday.new(:url => host)
    end

    def find_habit(id)
      data = JSON.parse( @connection.get("/api/v1/habits/#{id}.json").body )
    end

    def all_habits
      data = JSON.parse( @connection.get("/api/v1/habits.json").body )
    end

    def streak_days
      @habit = Habit.find(params[:id])
      @habit.streak_days
    end

    def status
      @status = event_require_update(@habit)
    end
  end
end
