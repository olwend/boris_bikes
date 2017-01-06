require 'docking_station'

describe DockingStation do
  # One line test to check if release_bike exists
  it { is_expected.to respond_to :release_bike }

  # Block test to check if release_bike exists
  it 'check if release_bike exists' do
    expect(DockingStation.new).to respond_to :release_bike
  end

  #test to check that only working bike can be released
  it 'check that working = false bike is not released' do

    bike = Bike.new
    bike.report_broken
    station = DockingStation.new
    station.dock_bike(bike)
    expect{station.release_bike}.to raise_error(RuntimeError)
    'RuntimeError bike is not working'
  end
  
#docking stations to accept returning bikes (broken or not)
  it 'bike can be docked if working or not' do
    bike = Bike.new
    bike.report_broken
    station = DockingStation.new
    num = station.bikes.count
    station.dock_bike(bike)
    expect(station.bikes.count).to eq num + 1
  end

  # check if bike can be docked
  it 'docks a bike' do
    expect(DockingStation.new).to respond_to :dock_bike
    #   it { is_expected.to respond_to(:dock_bike).with(1).argument }
  end

  #docking station has capacity = 20
 it 'docking station takes capacity of 25' do
     station = DockingStation.new(25)
   expect(station.capacity).to eq(25)
   end

   #docking station uses DEFAULT_CAPACITY
   it 'docking station uses default when no capacity passed in' do
      station = DockingStation.new()
    expect(station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
      end

    it 'raises an error when full' do

      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike Bike.new }
      expect { subject.dock_bike Bike.new }.to raise_error(RuntimeError)
      'RuntimeError: Station is full'
    end

  # Check if bike creates a new Bike Class and test working? method
  it 'releases working bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(bike).to respond_to :working
  end

  # Return true if the bike is docked
  it 'shows attribute docked if bike present' do

    station = DockingStation.new
    expect(station.bikes).to eq []
  end

  # Raise an error if there are no bikes
  #check if 1-20 bikes can be released
  it 'raises error if no bike present' do
    station = DockingStation.new
    expect {station.release_bike}.to raise_error(RuntimeError)
   'RuntimeError: No bikes available'
  end

end
