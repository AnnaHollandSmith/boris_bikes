require 'Van'

describe Van do 
  describe '#collect' do
    it 'collects single broken bike from docking station' do
    station = DockingStation.new(1)
    bike = Bike.new
    bike.report_broken
    station.dock(bike)
    van = Van.new
    expect(van.collect(bike)).to eq bike
	end
      
  end

end