require 'docking_station'
require 'Garages'
require 'Van'

describe Van do
#check method
  it 'check that van responds to take_bike method' do
    expect(Van.new).to respond_to :take_bike
  end

#check takes broken bikes
it 'check that van takes broken bikes' do

  station = DockingStation.new
  station.dock_bike(Bike.new)
  subject.take_bike
  expect(station.bikes.count).to eq 0
end

#check takes working bikes

#check that takes bikes from Garages

#check that takes bikes from DockingStations

end
