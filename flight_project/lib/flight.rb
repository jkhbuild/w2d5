require_relative "./passenger.rb"
class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger_instance)
        if passenger_instance.has_flight?(@flight_number) && !self.full?
            self.passengers << passenger_instance
        end
    end

    def list_passengers
        names = []
        @passengers.map { |passenger_instance| passenger_instance.name}
    end

    def [](index)
        @passengers[index]    
    end

    def <<(passenger_instance)
        self.board_passenger(passenger_instance)
    end

end