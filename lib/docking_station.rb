require_relative 'Bike'


class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes #add min function to stop bikes < 0
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
  	@bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    raise "Bike is not working" if !@bikes.last.working
    @bikes.pop
  end

  def release_maintenance
    @bikes.pop
  end

  def dock_bike(bike)
    #@capacity = 1
    raise "Station is full" if full?

    @bikes << bike

    #@bikes = true

    #@docked_bikes +=1
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
