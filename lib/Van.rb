require_relative 'docking_station'
require_relative 'Garages'

class Van

  def take_bike(location)
    #remove bike from @bikes
    location.release_bike
    #identify e.g.station is passed in
    #use station.release_bike - that station.bikes is -1
    # van.bikes array is +1 use same method as to dock bike
  end
end
