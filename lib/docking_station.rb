require_relative 'Bike'

class DockingStation

  attr_reader :bikes #add min function to stop bikes < 0
  attr_reader :capacity

  def initialize()
  	@bikes = []
    @capacity = 20
  end

  def release_bike
    raise "RuntimeError: No bikes available" if empty?
    empty?
    @bikes.pop
  end

  def dock_bike(bike)
    #@capacity = 1
    fail "RuntimeError: Station is full" if full?
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