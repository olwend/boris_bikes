require_relative 'Bike'

class DockingStation

  attr_reader :bikes #add min function to stop bikes < 0
  attr_reader :capacity

  def initialize()
  	@bikes = []
    @capacity = 20
  end

  def release_bike
    raise "RuntimeError: No bikes available" if !@bikes
    #@docked_bikes >= 0
    #@docked_bikes -= 1
    @bikes = false
    Bike.new
  end

  def dock_bike(bike)
    #@capacity = 1
    fail "RuntimeError: Station is full" if @bikes.count >= @capacity
    @bikes << bike #@capacity - @num_bikes == 0

    #@bikes = true

    #@docked_bikes +=1
  end



end
