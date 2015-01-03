#!/usr/bin/env ruby

module Habits
  class Streak
    #list of habits
    def index
      @habits = Habit.all
      respond_with Habit.all
    end

    def streak_days
      @habit = Habit.find(params[:id])
      @habit.streak_days
    end

    def show
      respond_with Habit.find(params[:id])
    end

    #see status of each habit
    def event_requires_update?(habit)
      habit.events.empty? || habit.events.last.created_at.day < Date.yesterday.day
    end

    #streak information
    def streak_days
      counter = 0
      events = self.events.sort_by {|event| event.created_at}.reverse

      while !events.empty?
        if events[0].completed == true
          counter += 1
        elsif events[0].completed == false
          events = []
        end
        events.shift
      end
      counter
    end
  end
end
