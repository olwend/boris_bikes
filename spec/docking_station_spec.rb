require 'docking_station'

describe DockingStation do
  
  let(:bike) { double :bike }
  
  # One line test to check if release_bike exists
  it { is_expected.to respond_to :release_bike }

  #test to check that only working bike can be released
  it 'check that working = false bike is not released' do
    #bike = double(:bike)
    allow(bike).to receive(:working).and_return(false)
    #bike.report_broken
    subject.dock_bike(bike)
    expect {subject.release_bike}.to raise_error 'Bike is not working'
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
  
  
  describe '#release_bike' do
    # Raise an error if there are no bikes
    it 'raises error if no bike present' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
  end
  
  
  describe '#dock_bike' do
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike double(:bike) }
      expect { subject.dock_bike double(:bike) }.to raise_error 'Station is full'
    end
    
    #docking stations to accept returning bikes (broken or not)
    it 'bike can be docked if working or not' do
      #bike = double(:bike)
      allow(bike).to receive(:working).and_return(false)
      #bike.report_broken
      num = subject.bikes.count
      subject.dock_bike(bike)
      expect(subject.bikes.count).to eq num + 1
    end
  end


  #Possibly redundant tests
=begin

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
=end
end