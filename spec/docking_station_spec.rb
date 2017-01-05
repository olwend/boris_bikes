require 'docking_station'

describe DockingStation do
  # One line test to check if release_bike exists
  it { is_expected.to respond_to :release_bike }

  # Block test to check if release_bike exists
  it 'check if release_bike exists' do
    expect(DockingStation.new).to respond_to :release_bike
  end

  # check if bike can be docked
  it 'docks a bike' do
    expect(DockingStation.new).to respond_to :dock_bike
    #   it { is_expected.to respond_to(:dock_bike).with(1).argument }
  end

  #docking station has capacity = 20
  it 'docking station has capacity of 20' do
    station = DockingStation.new
    expect(station.capacity).to eq(20)

  end

  # Check if bike creates a new Bike Class and test working? method
  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to respond_to :working?
  end

  # Return true if the bike is docked
  it 'shows attribute docked if bike present' do

    station = DockingStation.new
    expect(station.docked).to eq true
  end

  # Raise an error if there are no bikes
  it 'raises error if no bike present' do
    station = DockingStation.new
    station.release_bike
    expect {station.release_bike}.to raise_error 'RuntimeError: No bikes available'
  end

  it 'raises error if docking station is full' do
    station = DockingStation.new
    bike = Bike.new
    expect 20.times{station.dock_bike(bike)}.to raise_error(RuntimeError)
    'RuntimeError: Station is full'
  end

end
