require 'Van'

class Garage

	attr_reader :garage_bikes

	def initialize
		@garage_bikes = []
	end

	def bikes
		@garage_bikes = @van_bikes
	end

	
end 
