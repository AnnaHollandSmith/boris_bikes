require_relative 'Bike'

class DockingStation

  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
      @bikes = []
      @capacity = capacity
    end

  def release_bike
    raise "No bikes available!" if empty?
    raise "Sorry, there are no working bikes available!" if bikes.all? {|bike| bike.broken?}
    new_bike = bikes.find {|bike| !bike.broken?}
    bikes.delete(new_bike)
    new_bike
  end

  def dock(bike)
    raise "No space available!" if full?
    bikes << bike
  end

  private

  def full?
    true if bikes.length >= capacity
  end

  def empty?
    true if bikes.empty?
  end

end
