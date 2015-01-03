#!/usr/bin/env ruby

module Habits
  class Streak
    #list of habits
    def index
      @habits = Habit.all
    end

    def show
      respond_with Habit.find(params[:id])
    end

    #streak information
    def streak_days
      @habit = Habit.find(params[:id])
      @habit.streak_days
    end

    #see status of each habit
    def event_requires_update?(habit)
      habit.events.empty? || habit.events.last.created_at.day < Date.yesterday.day
    end    
  end
end
