rrequire_relative 'Bike'

class DockingStation

  attr_reader :docked

  def initialize(docked = true)
  	@docked = docked
  end

  def release_bike
    raise "RuntimeError: No bikes available" if !@docked
    @docked = false
    Bike.new
  end

  def dock_bike(x)
  	@docked = true
  end



end
