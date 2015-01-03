require './lib/events'

module HabitRabbitClient
  describe 'events' do
    before do
      @client = HabitRabbitClient::Event.new('http://localhost:3000')
    end

    it 'finds an event by id number' do
      event = @client.find_event(1)
      expect(event.name).to eq()
    end

    it 'finds all events' do
      events = @client.all_events
      expect(events.first['completed']).to eq(true)
      expect(events.first['habit_id']).to eq(1)
    end
  end
end
