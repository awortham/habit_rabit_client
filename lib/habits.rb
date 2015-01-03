require 'faraday'
require 'json'

module HabitRabbitClient
  class Habit

    def initialize(host)
      @connection = Faraday.new(:url => host)
    end
    #list of habits

    def find_habit(id)
      data = JSON.parse( @connection.get("/api/v1/habits/#{id}.json").body )
      # Habit.new(data)
    end

    def all_habits
      data = JSON.parse( @connection.get("/api/v1/habits.json").body )
    end

    #streak information
    def streak_days
      @habit = Habit.find(params[:id])
      @habit.streak_days
    end

    #see status of each habit
    def status
      @status = event_require_update(@habit)
    end
  end
end
