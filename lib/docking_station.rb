require_relative 'Bike'

class DockingStation

  attr_reader :docked_bikes #add min function to stop bikes < 0
  attr_reader :capacity

  def initialize(docked_bikes = true)
  	@docked_bikes = 1
    @capacity = 20
  end

  def release_bike
    raise "RuntimeError: No bikes available" if !@docked_bikes
    #@docked_bikes >= 0
    #@docked_bikes -= 1
    @docked_bikes = false
    Bike.new
  end

  def dock_bike(x)
    #@capacity = 1
    fail "RuntimeError: Station is full" if @docked_bikes
    #@capacity - @num_bikes == 0
    @docked_bikes = true
    #@docked_bikes +=1
  end



end
