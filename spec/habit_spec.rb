require './lib/habits'

module HabitRabbitClient
  describe 'habits' do
    before do
      @client = HabitRabbitClient::Habit.new('http://localhost:3000')
    end
    it 'finds a habit by id number' do
      habit = @client.find_habit(1)
      expect(habit['name']).to eq('first exercise')
    end

    it 'finds all habits' do
      habits = @client.all_habits
      expect(habits.first['name']).to eq('first exercise')
    end
  end
end
