require_relative 'DockingStation'
require_relative 'Garage'

class Van

	def initialize
		@van_bikes = []

	end
	def collect_broken_bikes(station)
		@van_bikes = station.bikes.select {|bike| bike.broken?}
	end

	def drops_broken_bikes(garage)
		@van_bikes
		#@van_bikes.clear
		#@garage_bikes

	end
end