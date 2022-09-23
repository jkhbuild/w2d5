require_relative "./flight.rb"
class Passenger

    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        @flight_numbers.include?(flight_number.upcase)
    end

    def add_flight(flight_number)
        @flight_numbers << flight_number.upcase if !self.has_flight?(flight_number)
    end

    def board_passenger(passenger_instance)
       if passenger.has_flight? && !Flight.passengers.full?
        Flight.passengers << passenger_instance
       end
    end

end