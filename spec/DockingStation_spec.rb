require 'DockingStation'

describe DockingStation do
  
  it {is_expected.to respond_to :release_bike}

  it {is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to (:bikes)}

  let(:bike) {double (:bike)}

  describe '#release_bike' do
    
    describe 'releasing when there are no broken bikes' do
      it 'releases a bike if bikes are available' do
        bike = double(:bike, broken?: !true)
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end
      it 'raises an error if no bikes available' do
        expect{subject.release_bike}.to raise_error("No bikes available!")
      end
     end 
    describe 'releasing when there are some broken bikes' do
      let(:bike1) {double(:bike)}
      let(:bike2) {double(:bike)}

      it 'doesn\'t release latest bike when latest bike is broken' do
        bike = double(:bike, report_broken: true, broken?: true)
        station = DockingStation.new(1)        
        bike.report_broken
        station.dock(bike)
        expect{station.release_bike}.to raise_error("Sorry, there are no working bikes available!")
      end
      it 'releases a bike when there are working bikes and the last one is broken' do
        station = DockingStation.new
        bike1 = double(:bike1, report_broken: true, broken?: true)
        bike2 = double(:bike2, broken?: !true)
        bike1.report_broken
        station.dock(bike2)
        station.dock(bike1)
        expect{station.release_bike}.not_to raise_error
      end
      it 'raises error when already removed all working bikes' do
        station = DockingStation.new
        bike1 = double(:bike1, report_broken: true, broken?: true)
        bike2 = double(:bike2, broken?: !true)
        bike1.report_broken
        station.dock(bike2)
        station.dock(bike1)
        station.release_bike
        expect{station.release_bike}.to raise_error("Sorry, there are no working bikes available!")
      end
    end
  end

  describe 'working?' do

    it 'releases working bikes' do
      bike = double(:bike, working?: true, broken?: !true)
      subject.dock(bike)
      subject.release_bike
      expect(bike).to be_working
    end
  end
    
  describe '#dock(bike)' do
    it 'returns docked bike' do 
      subject.dock(bike)
      expect(subject.bikes.last).to eq bike
    end
    it 'docks the bike when there is space available' do 
      expect(subject.dock(bike).last).to eq bike
    end
    it 'docks 20 bikes when capacity is set to default' do
      expect{DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}}.not_to raise_error
    end
    it 'raises an error when there is no space available when capacity is set to default' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error("No space available!")
    end
    it 'docks 50 bikes when capacity is set to 50' do
      station = DockingStation.new(50)
      expect{50.times {station.dock(bike)}}.not_to raise_error
    end
    it 'raises an error at 51 bikes when capacity is set to 50' do
      station = DockingStation.new(50)
      50.times {station.dock(bike)}
      expect{station.dock(bike)}.to raise_error("No space available!")
    end
  end

  describe '#initialize' do
    it 'initialises with one argument' do
      expect{DockingStation.new(30)}.not_to raise_error
    end
    it 'initialises with default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

end

