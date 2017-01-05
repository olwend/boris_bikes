require_relative 'Bike'

class DockingStation

  attr_reader :docked_bikes #add min function to stop bikes < 0
  attr_accessor :capacity

  def initialize(docked = true)
  	@docked_bikes = 1
    @capacity = 20
  end

  def release_bike
    raise "RuntimeError: No bikes available" if @docked_bikes >= 0
    @docked_bikes -= 1
    #@docked = false
    Bike.new
  end

  def dock_bike(x)
    #@capacity = 1
    fail "RuntimeError: Station is full" if @docked
    #@capacity - @num_bikes == 0
    @docked = true
    #@num_bikes +=1
    #@capacity
  end



end
