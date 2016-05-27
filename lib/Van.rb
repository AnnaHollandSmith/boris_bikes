require_relative 'DockingStation'

class Van
	def collect_broken_bikes(station)
		station.bikes.select {|bike| bike.broken?}
	end
end